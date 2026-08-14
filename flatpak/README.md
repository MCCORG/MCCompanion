# Flatpak packaging

This directory contains the files needed to distribute MCCompanion via
[Flathub](https://flathub.org) (the de-facto Linux app store).

## Files

| File | Purpose |
|------|---------|
| `com.mccorg.MCCompanion.yml` | Flatpak manifest (build recipe) |
| `com.mccorg.MCCompanion.desktop` | Desktop entry (launcher icon, categories) |
| `com.mccorg.MCCompanion.metainfo.xml` | AppStream metadata shown in software centres |
| `com.mccorg.MCCompanion.png` | 256×256 app icon (copied from `assets/images/logo.png` by CI) |

## CI workflow

`.github/workflows/build.yml` builds a self-contained `.flatpak` bundle
(and a `.snap` package) on every push to `main` and attaches both to the
published `dev` GitHub release so latest-release based package updaters can
track it automatically. Optional `[beta]` commits still create a separate
`beta` GitHub release for manual testing. Users can install it with:

```bash
flatpak install MCCompanion-linux.flatpak
```

## Submitting to Flathub

1. Fork <https://github.com/flathub/flathub>.
2. Create a branch named `new-pr/com.mccorg.MCCompanion`.
3. Add the four files from this directory to the branch root (update the tarball
   URL/sha256 in the manifest to point at a stable tagged release first).
4. Open a pull request against `flathub/flathub`.
5. Once approved and merged, Flathub's
   [flatpak-external-data-checker](https://github.com/flathub/flatpak-external-data-checker)
   bot will automatically bump the version whenever the published `dev`
   GitHub release is updated by polling `/releases/tags/dev` — no manual
   CI manifest pushes required for future updates.

## Auto-updates (Flatpak manifest sha256)

`.github/workflows/flatpak-update.yml` runs
[flatpak-external-data-checker](https://github.com/flathub-infra/flatpak-external-data-checker)
on a schedule (hourly). It downloads the tarball from the `dev` GitHub
release, computes its sha256, and if it has changed since the last run it
opens a pull request in this repo with the updated hash. This works with
the rolling `dev` tag because detection is based on sha256 change, not
version string change.
