import datetime
import unittest

from prepare_macos_entitlements import prepare


class PrepareMacosEntitlementsTest(unittest.TestCase):
    def setUp(self):
        self.entitlements = {
            "com.apple.developer.applesignin": ["Default"],
            "keychain-access-groups": ["TEAM.net.example.app"],
            "com.apple.security.network.client": True,
        }
        self.profile = {
            "ExpirationDate": datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(days=1),
            "Entitlements": {
                "keychain-access-groups": ["TEAM.*"],
                "com.apple.developer.applesignin": ["Default"],
            },
        }

    def test_authorized_apple_sign_in_is_preserved(self):
        result, enabled = prepare(self.entitlements, self.profile)
        self.assertTrue(enabled)
        self.assertEqual(result, self.entitlements)

    def test_missing_apple_capability_is_removed(self):
        del self.profile["Entitlements"]["com.apple.developer.applesignin"]
        result, enabled = prepare(self.entitlements, self.profile)
        self.assertFalse(enabled)
        self.assertNotIn("com.apple.developer.applesignin", result)
        self.assertEqual(result["keychain-access-groups"], ["TEAM.net.example.app"])
        self.assertIn("com.apple.developer.applesignin", self.entitlements)

    def test_unsigned_build_disables_apple_sign_in(self):
        result, enabled = prepare(self.entitlements, None)
        self.assertFalse(enabled)
        self.assertNotIn("com.apple.developer.applesignin", result)

    def test_unmatched_keychain_group_is_rejected(self):
        self.profile["Entitlements"]["keychain-access-groups"] = ["OTHER.*"]
        with self.assertRaisesRegex(ValueError, "keychain"):
            prepare(self.entitlements, self.profile)

    def test_expired_profile_is_rejected(self):
        self.profile["ExpirationDate"] = datetime.datetime.now(datetime.timezone.utc) - datetime.timedelta(days=1)
        with self.assertRaisesRegex(ValueError, "expired"):
            prepare(self.entitlements, self.profile)


if __name__ == "__main__":
    unittest.main()
