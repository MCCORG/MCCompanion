set -euo pipefail

cd "$(dirname "$0")/.."

BUMP="${1:-}"
if [ -z "$BUMP" ]; then
  echo "Usage: scripts/release.sh patch|minor|major|x.y.z"
  exit 1
fi

read_version() {
  sed -nE 's/^version: ([0-9]+\.[0-9]+\.[0-9]+)\+([0-9]+).*/\1+\2/p' pubspec.yaml
}

BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [ "$BRANCH" != "main" ]; then
  echo "You are on $BRANCH. Releases go out from main."
  exit 1
fi

if [ -n "$(git status --porcelain)" ]; then
  echo "There are uncommitted changes. Commit or stash them first:"
  git status --short
  exit 1
fi

echo "Fetching main…"
git pull --quiet --ff-only

OLD="$(read_version)"
python3 scripts/bump_version.py "$BUMP"
NEW="$(read_version)"
VERSION="${NEW%%+*}"

if git ls-remote --exit-code --tags origin "refs/tags/v$VERSION" >/dev/null 2>&1; then
  git checkout -- pubspec.yaml flatpak/net.mccompanion.MCCompanion.metainfo.xml
  echo "v$VERSION was already released. Nothing changed."
  exit 1
fi

echo
echo "  $OLD  ->  $NEW"
echo
printf "Release %s? [y/N] " "$VERSION"
read -r ANSWER
if [ "$ANSWER" != "y" ] && [ "$ANSWER" != "Y" ]; then
  git checkout -- pubspec.yaml flatpak/net.mccompanion.MCCompanion.metainfo.xml
  echo "Cancelled, nothing changed."
  exit 1
fi

git commit --quiet -m "Release $VERSION" -- \
  pubspec.yaml flatpak/net.mccompanion.MCCompanion.metainfo.xml
git push --quiet

echo
echo "Released $VERSION. Follow the build here:"
echo "  https://github.com/MCCORG/MCCompanion/actions/workflows/main.yml"
echo
echo "When it is done, upload the bundle to Play and the msix to Microsoft:"
echo "  https://github.com/MCCORG/MCCompanion/releases/tag/v$VERSION"
