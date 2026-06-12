/// Shared types used across the Milibris platform interface.
library;
// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

/// An adaptive color with separate light and dark variants.
///
/// Colors are ARGB32 integers (`0xAARRGGBB`), e.g. `0xFFFF1744` for opaque
/// red. [dark] falls back to [light] when not provided.
///
/// On Android, [light] maps to the light-mode XML resource and [dark] to the
/// dark-mode resource. If [dark] is omitted, both resources use [light].
///
/// On iOS, both values are combined into a single dynamic `UIColor` that
/// automatically adapts to the system appearance.
///
/// To create a [MilibrisColor] from a Flutter `Color`, use the
/// `MilibrisColorExtension.toMilibrisColor` extension on `Color`.
///
/// Example:
/// ```dart
/// const color = MilibrisColor(0xFFFFFFFF, dark: 0xFF000000);
/// ```
class MilibrisColor {
  /// Creates an adaptive color.
  ///
  /// [light] and [dark] are ARGB32 integers (`0xAARRGGBB`).
  const MilibrisColor(this.light, {this.dark});

  /// The color used in light mode (and in dark mode when [dark] is null).
  final int light;

  /// The color used in dark mode. Defaults to [light] if null.
  final int? dark;

  /// Serializes this color to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    'light': light,
    if (dark != null) 'dark': dark,
  };
}

/// Font specification for the Milibris reader.
///
/// On Android, fonts are applied via XML resource overrides in the host app —
/// this class has no runtime effect on Android.
class MilibrisFont {
  /// Creates a font specification.
  const MilibrisFont({
    this.name,
    this.size,
    this.bold = false,
    this.italic = false,
  });

  /// The font family name. Pass `null` to use the system font.
  final String? name;

  /// The font size in points.
  final double? size;

  /// Whether the font is bold.
  final bool bold;

  /// Whether the font is italic.
  final bool italic;

  /// Serializes this font to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (name != null) 'name': name,
    if (size != null) 'size': size,
    'bold': bold,
    'italic': italic,
  };
}

/// The primary brand font family for the article reader.
///
/// Maps to `ArticleReaderConfig.applyPrimaryFont` on iOS, which bulk-applies
/// these named fonts across the article reader's title, paragraph, and related
/// styles. iOS only at runtime — no effect on Android.
///
/// [regular] is required; the heavier weights fall back to the SDK defaults
/// when omitted. Each value is a registered font family name (the same string
/// you would pass to `UIFont(name:size:)`).
class MilibrisPrimaryFont {
  /// Creates a primary font family.
  const MilibrisPrimaryFont({required this.regular, this.black, this.bold});

  /// The regular-weight font family name.
  final String regular;

  /// The black-weight font family name.
  final String? black;

  /// The bold-weight font family name.
  final String? bold;

  /// Serializes this font family to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    'regular': regular,
    if (black != null) 'black': black,
    if (bold != null) 'bold': bold,
  };
}

/// The secondary brand font family for the article reader.
///
/// Maps to `ArticleReaderConfig.applySecondaryFont` on iOS. iOS only at
/// runtime — no effect on Android.
class MilibrisSecondaryFont {
  /// Creates a secondary font family.
  const MilibrisSecondaryFont({
    required this.regular,
    this.medium,
    this.semiBold,
  });

  /// The regular-weight font family name.
  final String regular;

  /// The medium-weight font family name.
  final String? medium;

  /// The semi-bold-weight font family name.
  final String? semiBold;

  /// Serializes this font family to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    'regular': regular,
    if (medium != null) 'medium': medium,
    if (semiBold != null) 'semiBold': semiBold,
  };
}

/// The tertiary brand font family for the article reader.
///
/// Maps to `ArticleReaderConfig.applyTertiaryFont` on iOS. iOS only at
/// runtime — no effect on Android.
class MilibrisTertiaryFont {
  /// Creates a tertiary font family.
  const MilibrisTertiaryFont({
    required this.regular,
    this.black,
    this.bold,
    this.italic,
  });

  /// The regular-weight font family name.
  final String regular;

  /// The black-weight font family name.
  final String? black;

  /// The bold-weight font family name.
  final String? bold;

  /// The italic-style font family name.
  final String? italic;

  /// Serializes this font family to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    'regular': regular,
    if (black != null) 'black': black,
    if (bold != null) 'bold': bold,
    if (italic != null) 'italic': italic,
  };
}

/// Combined color + font + line spacing for a text element.
///
/// iOS only at runtime. Android equivalent is a `TextAppearance` XML style.
class MilibrisTextConfig {
  /// Creates a text config.
  const MilibrisTextConfig({this.color, this.font, this.lineSpacing});

  /// The adaptive text color.
  final MilibrisColor? color;

  /// The font specification.
  final MilibrisFont? font;

  /// Line spacing multiplier.
  final double? lineSpacing;

  /// Serializes this text config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (color != null) 'color': color!.toMap(),
    if (font != null) 'font': font!.toMap(),
    if (lineSpacing != null) 'lineSpacing': lineSpacing,
  };
}
