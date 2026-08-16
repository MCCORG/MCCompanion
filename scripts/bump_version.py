#!/usr/bin/env python3
"""Raise the app version.

Usage:
    scripts/bump_version.py patch|minor|major
    scripts/bump_version.py 4.2.0

pubspec.yaml is the only place the version is written. snapcraft.yaml, the
AppStream metadata and the MSIX all get theirs from here during the build, so
there is nothing left that can drift out of step.

The build number always goes up by one. The stores reject a rebuild that
reuses one, and they remember numbers from uploads you have long since
withdrawn, so it never goes back down either.
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PUBSPEC = ROOT / "pubspec.yaml"

VERSION_LINE = re.compile(r"(?m)^version:\s*(\d+\.\d+\.\d+)\+(\d+)[^\S\n]*$")


def fail(message):
    sys.exit(f"error: {message}")


def read_version():
    match = VERSION_LINE.search(PUBSPEC.read_text())
    if not match:
        fail("no 'version: x.y.z+n' line in pubspec.yaml")
    return match.group(1), int(match.group(2))


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

    old_version, old_build = read_version()
    version = next_version(old_version, sys.argv[1])
    build = old_build + 1

    if version == old_version:
        fail(f"version is already {version}")

    text, count = VERSION_LINE.subn(f"version: {version}+{build}", PUBSPEC.read_text(), count=1)
    if count != 1:
        fail("could not rewrite the version line in pubspec.yaml")
    PUBSPEC.write_text(text)

    print(f"{old_version}+{old_build} -> {version}+{build}")


if __name__ == "__main__":
    main()
