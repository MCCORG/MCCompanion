#!/usr/bin/env python3
"""Make sure the AppStream metadata lists this version as the newest release.

Usage:
    scripts/set_release_entry.py 4.1.8 2026-08-16 [path]

Idempotent: an entry that already exists gets its date corrected and is moved
to the front, so rerunning a release cannot produce a duplicate. The rest of
the history is left exactly as it is.

Flathub reads this file, and it refuses a build whose newest release entry does
not match the version being shipped. It is also the file that keeps getting
hand-edited, which is why the parsing here is strict about what it accepts.
"""

import re
import sys
from pathlib import Path
from xml.etree import ElementTree

ROOT = Path(__file__).resolve().parent.parent
DEFAULT = ROOT / "flatpak" / "net.mccompanion.MCCompanion.metainfo.xml"

DESCRIPTION = "<p>See GitHub releases for the full changelog.</p>"


def fail(message):
    sys.exit(f"error: {message}")


def main():
    if len(sys.argv) not in (3, 4):
        sys.exit(__doc__)

    version, release_date = sys.argv[1], sys.argv[2]
    path = Path(sys.argv[3]) if len(sys.argv) == 4 else DEFAULT

    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        fail(f"expected an x.y.z version, got {version!r}")
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}", release_date):
        fail(f"expected a yyyy-mm-dd date, got {release_date!r}")

    text = path.read_text()

    # Parsed purely to reject a file that is not well formed. The edit itself is
    # textual, so the hand-written indentation and comments survive untouched.
    try:
        ElementTree.fromstring(text)
    except ElementTree.ParseError as error:
        fail(f"{path} is not valid XML: {error}")

    # Drop any existing entry for this version, wherever it sits.
    text, removed = re.subn(
        rf'(?ms)^[^\S\n]*<release version="{re.escape(version)}".*?</release>\n',
        "",
        text,
    )

    entry = (
        f'    <release version="{version}" date="{release_date}">\n'
        f"      <description>{DESCRIPTION}</description>\n"
        f"    </release>\n"
    )

    text, count = re.subn(
        r"(?m)^([^\S\n]*)<releases>[^\S\n]*\n",
        lambda match: f"{match.group(1)}<releases>\n{entry}",
        text,
        count=1,
    )
    if count != 1:
        fail(f"{path} has no <releases> block to insert into")

    try:
        root = ElementTree.fromstring(text)
    except ElementTree.ParseError as error:
        fail(f"the edit produced invalid XML: {error}")

    newest = root.find("releases")[0]
    if newest.get("version") != version:
        fail(f"newest entry is {newest.get('version')}, expected {version}")

    path.write_text(text)
    action = "moved to the front" if removed else "added"
    print(f"{path.name}: {version} ({release_date}) {action}")


if __name__ == "__main__":
    main()
