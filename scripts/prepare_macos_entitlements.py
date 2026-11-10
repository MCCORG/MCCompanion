#!/usr/bin/env python3
"""Prepare release entitlements supported by the macOS provisioning profile."""

import datetime
import fnmatch
import plistlib
import sys
from pathlib import Path


def prepare(entitlements, profile):
    result = entitlements.copy()
    apple_enabled = False
    if profile is not None:
        expiry = profile.get("ExpirationDate")
        if not isinstance(expiry, datetime.datetime):
            raise ValueError("The macOS provisioning profile is missing an expiry date or has expired.")
        if expiry.tzinfo is None:
            expiry = expiry.replace(tzinfo=datetime.timezone.utc)
        if expiry <= datetime.datetime.now(datetime.timezone.utc):
            raise ValueError("The macOS provisioning profile is missing an expiry date or has expired.")

        allowed = profile.get("Entitlements", {})
        requested_groups = result.get("keychain-access-groups", [])
        allowed_groups = allowed.get("keychain-access-groups", [])
        if not all(
            any(fnmatch.fnmatchcase(group, pattern) for pattern in allowed_groups)
            for group in requested_groups
        ):
            raise ValueError("The macOS provisioning profile does not authorize the requested keychain access groups.")

        requested_apple = result.get("com.apple.developer.applesignin", [])
        allowed_apple = allowed.get("com.apple.developer.applesignin", [])
        apple_enabled = bool(requested_apple) and all(
            value in allowed_apple for value in requested_apple
        )

    if not apple_enabled:
        result.pop("com.apple.developer.applesignin", None)
    return result, apple_enabled


def main():
    if len(sys.argv) not in (3, 4):
        raise SystemExit("Usage: prepare_macos_entitlements.py ENTITLEMENTS OUTPUT [PROFILE_PLIST]")
    try:
        with open(sys.argv[1], "rb") as source:
            entitlements = plistlib.load(source)
        profile = None
        if len(sys.argv) == 4:
            with open(sys.argv[3], "rb") as source:
                profile = plistlib.load(source)
        result, apple_enabled = prepare(entitlements, profile)
        with Path(sys.argv[2]).open("wb") as target:
            plistlib.dump(result, target)
    except (OSError, ValueError, plistlib.InvalidFileException) as error:
        raise SystemExit(f"Cannot prepare macOS entitlements: {error}") from error
    print(str(apple_enabled).lower())


if __name__ == "__main__":
    main()
