# How building and releasing works

Everything below is automated. This page exists so nobody has to reverse
engineer the workflows to answer a simple question.

## The short version

The version in `pubspec.yaml` decides what a commit on `main` does.

| you push to main | what happens |
| --- | --- |
| version unchanged | all six platforms build, the rolling `dev` release is replaced |
| version raised | all six build, plus a Play bundle, then it is tagged, released, uploaded to the Snap Store, and a Flathub manifest is attached |

To release:

```bash
git checkout main && git pull
git checkout -b release/4.2.0
python3 scripts/bump_version.py patch     # or minor, major, or 4.2.0
git commit -am "Release 4.2.0"
git push -u origin release/4.2.0
```

Open the pull request, wait for CI, merge. Merging is the release. Nothing else
to press.

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

## Versions live in one file

`pubspec.yaml` is the only place the version is written. `scripts/bump_version.py`
edits that one line, and adds a changelog entry to the AppStream metadata.

Everything else derives it at build time: the MSIX gets it as an argument to
`msix:create`, snapcraft gets it written in, and the metainfo release entry is
rewritten by `scripts/set_release_entry.py`.

The build number always goes up by one. Stores reject a rebuild that reuses one,
and they remember numbers from uploads you withdrew years ago.

## The tag comes last

The tag is created by the release job, after the build has passed, on the commit
that was built. A tag pointing at a version nobody managed to build cannot
exist.

This matters because it went wrong once. A tag pushed with the default
`GITHUB_TOKEN` never starts another workflow, by design, so a version was tagged
and no build ever ran. There is no separate tagging step any more.

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
rewrites each source to a url on the tag with the hash of the file that tag
serves, and attaches the result to the release:

```
https://github.com/MCCORG/MCCompanion/releases/latest/download/net.mccompanion.MCCompanion.yml
```

That is the file for the Flathub pull request. A tag never moves, so it stays
correct. The `x-checker-data` blocks survive the rewrite and their `url-query`
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
Play remembers every number ever uploaded, including withdrawn ones.
