#!/usr/bin/env python3
"""Pin flutpak's generated manifest to the exact source and build version."""

import argparse
import re
from pathlib import Path

import yaml


def prepare(path, commit, repository, version, number, date):
    if not re.fullmatch(r"[0-9a-f]{40}", commit):
        raise ValueError("commit must be a full lowercase Git SHA")
    if not re.fullmatch(r"[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+", repository):
        raise ValueError("repository must be an owner/name pair")
    if not re.fullmatch(r"\d+\.\d+\.\d+", version):
        raise ValueError("version must be X.Y.Z")
    if not re.fullmatch(r"\d+", number):
        raise ValueError("build number must be numeric")
    if not re.fullmatch(r"\d{4}-\d{2}-\d{2}", date):
        raise ValueError("date must be YYYY-MM-DD")

    manifest = yaml.safe_load(path.read_text())
    apps = [m for m in manifest["modules"] if isinstance(m, dict) and m.get("name") == "MCCompanion"]
    if len(apps) != 1:
        raise ValueError("expected exactly one MCCompanion module")
    app = apps[0]
    sources = [s for s in app["sources"] if isinstance(s, dict) and s.get("type") == "git"]
    if len(sources) != 1 or sources[0].get("commit") != commit:
        raise ValueError("expected the generated app source to match the build commit")
    if "pubspec-sources.json" not in app["sources"]:
        raise ValueError("missing generated pub sources")
    if not any(isinstance(m, str) and m.startswith("flutter-sdk-") and m.endswith(".json")
               for m in manifest["modules"]):
        raise ValueError("missing generated Flutter SDK module")

    source = sources[0]
    source.pop("tag", None)
    source["url"] = f"https://github.com/{repository}.git"
    values = {"@BUILD_NAME@": version, "@BUILD_NUMBER@": number, "@RELEASE_DATE@": date}
    for placeholder, value in values.items():
        count = sum(command.count(placeholder) for command in app["build-commands"])
        expected = 2 if placeholder == "@BUILD_NAME@" else 1
        if count != expected:
            raise ValueError(f"expected {expected} occurrences of {placeholder}, got {count}")
        app["build-commands"] = [command.replace(placeholder, value) for command in app["build-commands"]]
    path.write_text(yaml.safe_dump(manifest, sort_keys=False, allow_unicode=True))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("manifest", type=Path)
    parser.add_argument("commit")
    parser.add_argument("repository")
    parser.add_argument("version")
    parser.add_argument("number")
    parser.add_argument("date")
    args = parser.parse_args()
    prepare(args.manifest, args.commit, args.repository, args.version, args.number, args.date)


if __name__ == "__main__":
    main()
