# Flatpak packaging

`net.mccompanion.MCCompanion.yml` is a flutpak template, not a standalone
manifest. It builds the application from its Git source; it does not install
the Linux release tarball. `flutpak.yaml` pins the Flutter version and flutpak
registries. Keep its Flutter version in sync with `FLUTTER_VERSION` in
`.github/workflows/build-app.yml`.

The Flatpak build job runs flutpak, pins the generated manifest to the exact
source commit and release version, and builds it with flatpak-builder. The
bundle and the generated manifest are attached to dev and stable releases.
`MCCompanion-flathub-sources.tar.gz` contains the manifest, dependency JSON
files and any patches together; the standalone manifest needs those files
alongside it.

To test only the Flatpak, open Actions > Flatpak > Run workflow, select the
branch and enter the build version and number. Download the `linux-flatpak`
artifact from the completed run. GitHub only offers manual dispatch after the
workflow file exists on the default branch. This does not publish a release or
submit anything to Flathub.

To generate and build locally, install flutpak v0.9.0, Dart, Flatpak,
flatpak-builder, and Python 3 with PyYAML. The commit must be available from
the specified GitHub repository:

```bash
flutpak generate --commit "$(git rev-parse HEAD)" --flutter 3.44.0
python3 scripts/prepare_flathub_manifest.py \
  flatpak/generated/net.mccompanion.MCCompanion.yml \
  "$(git rev-parse HEAD)" MCCORG/MCCompanion 5.2.0 59 2026-01-01
flatpak remote-add --user --if-not-exists flathub \
  https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak-builder --user --install-deps-from=flathub --force-clean \
  --repo=/tmp/mccompanion-flatpak-repo /tmp/mccompanion-flatpak-build \
  flatpak/generated/net.mccompanion.MCCompanion.yml
```

Replace the repository, version, build number, and date with the values being
tested. The `generated/` directory is disposable and must be regenerated
after changes to dependencies or the Flutter version.

For a Flathub submission, unpack the release's
`MCCompanion-flathub-sources.tar.gz` into the Flathub repository and submit all
of its contents. A new release requires regenerating **all** of these files:
updating the source commit alone can leave stale dependency hashes. No
automatic Flathub submission or dependency update is configured.
