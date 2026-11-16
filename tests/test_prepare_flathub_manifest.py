import tempfile
import unittest
from pathlib import Path

import yaml

from scripts.prepare_flathub_manifest import prepare


COMMIT = "a" * 40


class PrepareManifestTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.path = Path(self.temp.name) / "manifest.yml"
        self.manifest = {
            "modules": [
                "flutter-sdk-3.44.0.json",
                {
                    "name": "MCCompanion",
                    "sources": [
                        {"type": "git", "url": "https://example.com/old.git", "tag": COMMIT, "commit": COMMIT},
                        "pubspec-sources.json",
                    ],
                    "build-commands": [
                        "flutter build linux --build-name=@BUILD_NAME@ --build-number=@BUILD_NUMBER@",
                        "python3 scripts/set_release_entry.py @BUILD_NAME@ @RELEASE_DATE@",
                    ],
                },
            ],
        }
        self.write_manifest()

    def write_manifest(self):
        self.path.write_text(yaml.safe_dump(self.manifest))

    def prepare(self, commit=COMMIT, repository="owner/repo"):
        prepare(self.path, commit, repository, "5.2.0", "59", "2026-11-16")

    def test_pins_source_and_build_values(self):
        self.prepare()
        app = yaml.safe_load(self.path.read_text())["modules"][1]
        self.assertEqual(app["sources"][0], {
            "type": "git",
            "url": "https://github.com/owner/repo.git",
            "commit": COMMIT,
        })
        self.assertEqual(app["build-commands"], [
            "flutter build linux --build-name=5.2.0 --build-number=59",
            "python3 scripts/set_release_entry.py 5.2.0 2026-11-16",
        ])

    def test_rejects_mismatched_commit_and_missing_modules(self):
        with self.assertRaises(ValueError):
            self.prepare(commit="b" * 40)
        self.manifest["modules"].pop(0)
        self.write_manifest()
        with self.assertRaises(ValueError):
            self.prepare()

    def test_rejects_untrusted_repository_and_missing_placeholder(self):
        with self.assertRaises(ValueError):
            self.prepare(repository="owner/repo;echo test")
        self.manifest["modules"][1]["build-commands"].pop()
        self.write_manifest()
        with self.assertRaises(ValueError):
            self.prepare()


if __name__ == "__main__":
    unittest.main()
