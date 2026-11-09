# 0.2.3

- Bumped `flutter_milibris_platform_interface` dependency to `^0.2.3`.
- Added `articlesLanguageCode` to reader config (iOS): fixes iOS not showing the text to speech button when the `articlesLanguageCode` is unset on the iOS SDK.

# 0.2.2

- Applied article reader brand font families via the SDK's `applyPrimaryFont`, `applySecondaryFont`, and `applyTertiaryFont` methods (applied before per-element overrides so those still take precedence).
- Mapped paragraph inline run fonts to `fonts.paragraphB`, `fonts.paragraphStrong`, `fonts.paragraphI`, and `fonts.paragraphEm`.
- Bumped `flutter_milibris_platform_interface` dependency to `^0.2.2`.

# 0.2.1

- Bumped `flutter_milibris_platform_interface` dependency to `^0.2.1`.

# 0.2.0

- Version bump only — no iOS-specific changes.

# 0.1.1

- Added support for `MilibrisUIConfig`: colors, fonts, and feature flags are now forwarded to the iOS reader at runtime via `ReaderConfigMapper`.

# 0.1.0+1

- Initial release of this plugin.
