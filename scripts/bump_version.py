#!/usr/bin/env python3
"""Bump the app version everywhere it is written by hand.

Usage:
    scripts/bump_version.py patch|minor|major
    scripts/bump_version.py 4.2.0

The build number is taken from pubspec.yaml and always incremented by one,
because the stores reject a rebuild that reuses it.

snap/snapcraft.yaml is patched here too so the repo stays honest, even though
the release workflow rewrites it from the pubspec version at build time.
"""

import re
import sys
from datetime import date
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PUBSPEC = ROOT / "pubspec.yaml"
SNAPCRAFT = ROOT / "snap" / "snapcraft.yaml"
METAINFO = ROOT / "flatpak" / "net.mccompanion.MCCompanion.metainfo.xml"


def fail(message):
    sys.exit(f"error: {message}")


def sub_once(text, pattern, replacement, what):
    new_text, count = re.subn(pattern, replacement, text, count=1)
    if count != 1:
        fail(f"could not update {what} (matched {count} times, expected 1)")
    return new_text


def next_version(current, arg):
    if re.fullmatch(r"\d+\.\d+\.\d+", arg):
        return arg
    major, minor, patch = (int(p) for p in current.split("."))
    if arg == "major":
        return f"{major + 1}.0.0"
    if arg == "minor":
        return f"{major}.{minor + 1}.0"
    if arg == "patch":
        return f"{major}.{minor}.{patch + 1}"
    fail(f"expected patch, minor, major or an x.y.z version, got {arg!r}")


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)

    pubspec = PUBSPEC.read_text()
    match = re.search(r"(?m)^version:\s*(\d+\.\d+\.\d+)\+(\d+)[^\S\n]*$", pubspec)
    if not match:
        fail("no 'version: x.y.z+n' line in pubspec.yaml")

    old_version, old_build = match.group(1), int(match.group(2))
    version = next_version(old_version, sys.argv[1])
    build = old_build + 1
    today = date.today().isoformat()

    if version == old_version:
        fail(f"version is already {version}")

    pubspec = sub_once(
        pubspec,
        r"(?m)^version:\s*\d+\.\d+\.\d+\+\d+[^\S\n]*$",
        f"version: {version}+{build}",
        "version in pubspec.yaml",
    )
    pubspec = sub_once(
        pubspec,
        r"(?m)^(\s*msix_version:\s*)\d+\.\d+\.\d+\.\d+[^\S\n]*$",
        rf"\g<1>{version}.0",
        "msix_version in pubspec.yaml",
    )

    snapcraft = sub_once(
        SNAPCRAFT.read_text(),
        r"(?m)^version:\s*['\"][^'\"]+['\"][^\S\n]*$",
        f"version: '{version}'",
        "version in snapcraft.yaml",
    )

    metainfo = METAINFO.read_text()
    if f'<release version="{version}"' in metainfo:
        fail(f"metainfo.xml already has a release entry for {version}")
    entry = (
        f'    <release version="{version}" date="{today}">\n'
        f"      <description><p>See GitHub releases for the full changelog.</p></description>\n"
        f"    </release>\n"
    )
    metainfo = sub_once(
        metainfo,
        r"(?m)^(\s*)<releases>\n",
        lambda m: f"{m.group(1)}<releases>\n{entry}",
        "releases block in metainfo.xml",
    )

    PUBSPEC.write_text(pubspec)
    SNAPCRAFT.write_text(snapcraft)
    METAINFO.write_text(metainfo)

    print(f"{old_version}+{old_build} -> {version}+{build}")
    print(f"  pubspec.yaml      version + msix_version")
    print(f"  snapcraft.yaml    version")
    print(f"  metainfo.xml      new release entry, dated {today}")


if __name__ == "__main__":
    main()
