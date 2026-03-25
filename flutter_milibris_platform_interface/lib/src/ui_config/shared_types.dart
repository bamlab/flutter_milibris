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
