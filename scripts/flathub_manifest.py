#!/usr/bin/env python3
"""Turn the local Flatpak manifest into the one Flathub can build.

Usage:
    scripts/flathub_manifest.py v4.1.8 path/to/MCCompanion-linux-x64.tar.gz

The manifest in this repository points at the files next to it, so it carries
no urls and no hashes and can never go stale. Flathub builds from its own
repository and cannot reach those paths, so every source is rewritten here to a
url on the given tag, with the sha256 computed from the file that url serves.

Nothing moves after a tag is pushed, so the result stays correct forever. The
x-checker-data blocks let Flathub's own updater bump it to the next release
without anyone editing a sha by hand.
"""

import hashlib
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MANIFEST = ROOT / "flatpak" / "net.mccompanion.MCCompanion.yml"

REPO = "MCCORG/MCCompanion"
TARBALL = "MCCompanion-linux-x64.tar.gz"
LATEST = f"https://api.github.com/repos/{REPO}/releases/latest"


def fail(message):
    sys.exit(f"error: {message}")


def sha256(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def archive_source(tag, tarball):
    return f"""      - type: archive
        url: https://github.com/{REPO}/releases/download/{tag}/{TARBALL}
        sha256: {sha256(tarball)}
        x-checker-data:
          type: json
          url: {LATEST}
          version-query: .tag_name | sub("^v"; "")
          url-query: .assets[] | select(.name == "{TARBALL}") | .browser_download_url
          is-main-source: true
"""


def file_source(tag, name):
    path = ROOT / "flatpak" / name
    if not path.exists():
        fail(f"{name} is not in flatpak/")
    url = f"https://github.com/{REPO}/releases/download/{tag}/{name}"
    query = f'.assets[] | select(.name == "{name}") | .browser_download_url'
    return f"""      - type: file
        url: {url}
        sha256: {sha256(path)}
        dest-filename: {name}
        x-checker-data:
          type: json
          url: {LATEST}
          version-query: .tag_name | sub("^v"; "")
          url-query: {query}
"""


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)

    tag, tarball = sys.argv[1], sys.argv[2]
    if not re.fullmatch(r"v\d+\.\d+\.\d+", tag):
        fail(f"expected a vX.Y.Z tag, got {tag!r}")
    if not Path(tarball).is_file():
        fail(f"no tarball at {tarball}")

    text = MANIFEST.read_text()

    marker = "      - type: archive\n        path: MCCompanion-linux-x64.tar.gz\n"
    if marker not in text:
        fail("the manifest no longer starts its sources with the local tarball")

    start = text.index(marker)
    rewritten = archive_source(tag, tarball)
    for name in (
        "net.mccompanion.MCCompanion.metainfo.xml",
        "net.mccompanion.MCCompanion.desktop",
        "net.mccompanion.MCCompanion.png",
    ):
        expected = f"      - type: file\n        path: {name}\n"
        if expected not in text[start:]:
            fail(f"{name} is not a local source in the manifest")
        rewritten += file_source(tag, name)

    header = (
        f"# Generated for {tag}. Do not edit by hand: rerun\n"
        f"# scripts/flathub_manifest.py against the release you want.\n"
    )
    print(header + text[:start] + rewritten, end="")


if __name__ == "__main__":
    main()
