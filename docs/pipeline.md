# How building and releasing works

Everything below is automated. This page exists so nobody has to reverse
engineer the workflows to answer a simple question.

## The short version

Your commit message decides what a commit on `main` does.

| the first line of your commit | what happens |
| --- | --- |
| no marker | all six platforms build, the rolling `dev` release is replaced |
| contains `[patch]`, `[minor]` or `[major]` | all six build, plus a Play bundle, then it is tagged, released, uploaded to the Snap Store, and a Flathub manifest is attached |

So a release is just a commit you named:

```
Fix the crash when a server times out [patch]     4.1.9 -> 4.1.10
Warn standalone builds about updates [minor]      4.1.9 -> 4.2.0
Drop support for the old relay [major]            4.1.9 -> 5.0.0
```

On a squash merge the first line is the pull request title, so that is where
you write it. Nothing else to press, no version to look up.

## The three workflows

**`ci.yml`** runs on pull requests. It builds everything and publishes nothing.

It first decides whether a build is needed at all. Only changes that end up in a
build trigger one: `lib/`, `android/`, `ios/`, `macos/`, `windows/`, `linux/`,
`assets/`, `test/`, `pubspec.yaml`, `pubspec.lock`, `l10n.yaml`,
`analysis_options.yaml`, `firebase.json`, the app icons, plus `scripts/` and
`.github/workflows/` because those are what does the building. Everything else,
packaging metadata and prose included, skips the fourteen minutes.

The required status check in the branch ruleset is **`CI complete`**, not the
six platform jobs. A skipped job reports no check at all, so requiring those
directly would leave a documentation change waiting forever.

**`main.yml`** runs on every push to `main`. One workflow, six jobs: decide,
build, then either update the dev release or publish a real one, and for a
release also the Snap upload and the Flathub manifest.

**`build-app.yml`** is not a workflow you trigger. It is the shared build,
called by the other two, so a Flutter bump is a one line change in one place.

## Where the version comes from

Nothing in the repository records it. The workflow reads the newest `v*` tag,
adds one to the part you asked for, and builds with that. That is why nothing
has to be committed back to `main`, which matters because a workflow cannot
push to a protected branch.

The build number is the number of commits on `main`. It goes up by one every
time, it never resets, and a force push is blocked, so it can only ever
increase. The stores reject a build number they have seen before.

`pubspec.yaml` still carries a version, but only for local builds. It does not
track releases and it does not have to be kept in step.

The AppStream release entry is written during the build by
`scripts/set_release_entry.py`, so the changelog Flathub shows always matches
the version being shipped.

## The tag comes last

The tag is created by the release job, after the build has passed, on the commit
that was built. A tag pointing at a version nobody managed to build cannot
exist.

This matters because it went wrong once. A tag pushed with the default
`GITHUB_TOKEN` never starts another workflow, by design, so a version was tagged
and no build ever ran. There is no separate tagging step any more, and no token
is needed for any of it.

## Flatpak, and why the manifest has no hashes

`flatpak/net.mccompanion.MCCompanion.yml` points at the files next to it with
`path:`, so it carries no urls and no `sha256`. Nothing in it can go stale, and
there is nothing to renew by hand. To build it locally:

```bash
flutter build linux --release
# pack the bundle as MCCompanion-linux-x64.tar.gz and drop it in flatpak/
flatpak-builder --user --install-deps-from=flathub --force-clean \
  --repo=/tmp/repo /tmp/build flatpak/net.mccompanion.MCCompanion.yml
```

Flathub builds from its own repository and cannot reach those paths, so it needs
urls, and a url needs a hash. On every release `scripts/flathub_manifest.py`
rewrites each source to a url on the release, with the hash of the file attached
there, and the result goes onto the release itself:

```
https://github.com/MCCORG/MCCompanion/releases/latest/download/net.mccompanion.MCCompanion.yml
```

The metadata, the desktop file and the icon are attached alongside it, because
the release entry is written during the build and the copy on the branch is not
the copy that belongs to this version. That is the file for the Flathub pull
request, and a release asset never changes, so it stays correct. The `x-checker-data` blocks survive the rewrite and their `url-query`
builds from `.tag_name`, so Flathub's own updater keeps working: it checks our
releases hourly and opens a pull request in the Flathub repository with the new
url and hash. Nobody edits a hash by hand, on either side.

## What still happens by hand

| store | how |
| --- | --- |
| Google Play | upload `MCCompanion-android.aab` |
| Microsoft Store | upload `MCCompanion.msix` |
| Snap Store | automatic, see below |
| Flathub | merge the bot's pull request, or paste the generated manifest |

The Snap upload runs on every release. The channel comes from the repository
variable `SNAP_CHANNEL`, which is a variable and not a secret so the channel is
visible in the log. It defaults to `edge` when unset.

The APK on the release is for sideloading and for us. Play wants the bundle.

## Secrets and variables

| name | used for | what breaks without it |
| --- | --- | --- |
| `ANDROID_KEYSTORE_BASE64` | signing Android | the build fails |
| `KEYSTORE_PASSWORD`, `KEY_PASSWORD`, `KEY_ALIAS` | same | the build fails |
| `ANDROID_SIGNING_SHA256` | checking the signing key | only a warning, but a wrong key ships |
| `MACOS_CERTIFICATE_P12`, `MACOS_CERTIFICATE_PASSWORD` | signing macOS | falls back to ad-hoc, Gatekeeper blocks it |
| `MACOS_SIGN_IDENTITY`, `APPLE_TEAM_ID` | same | same |
| `APPLE_ID`, `APPLE_APP_PASSWORD` | notarizing | signed but not notarized |
| `MACOS_PROVISIONING_PROFILE` | restricted entitlements | the app refuses to launch |
| `SNAPCRAFT_STORE_CREDENTIALS` | Snap upload | the job skips with a message |
| `DISCORD_WEBHOOK_URL` | build notifications | no message |
| `SNAP_CHANNEL` (variable) | Snap channel | defaults to `edge` |

The Developer ID certificate expires on 1 February 2027. Around then: request a
new one, export it from Keychain Access as a `.p12`, and replace the first two
macOS secrets. Apps already signed and notarized keep working, because signing
includes a timestamp.

## Things that have already bitten us

**A branch that was squash merged cannot be reused.** Git does not see its
commits as merged, so the next pull request conflicts on everything. Delete it
and start a fresh branch from `main`.

**Do not revert by hand.** Retyping a change removed one line too many and left
invalid XML on `main`, which surfaced as a Flatpak build failure twenty minutes
in. `git revert` cannot make that mistake.

**Export the p12 from Keychain Access, not with `openssl pkcs12 -export`.**
OpenSSL 3 uses encryption that the `security` command on the runner cannot read,
and the error it gives is `MAC verification failed (wrong password?)` even when
the password is right.

**macOS refuses to launch an app that claims restricted entitlements without a
provisioning profile.** `Sign in with Apple` and `keychain-access-groups` are
both restricted. The only message you get is "the application cannot be opened".
Xcode embeds the profile when building by hand, which is why manual dmgs always
worked; CI does it from `MACOS_PROVISIONING_PROFILE`.

**Check the highest build number in the Play Console** if an upload is rejected.
Play remembers every number ever uploaded, including withdrawn ones. The build
number is the commit count, which is far above anything uploaded before, so
this should not come up again.

**A marker only counts on the first line.** `[patch]` on the second line of a
commit message does nothing, and neither does the word patch without brackets.
