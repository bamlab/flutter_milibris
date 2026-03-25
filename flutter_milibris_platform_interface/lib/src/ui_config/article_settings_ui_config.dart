import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for the font/brightness settings panel in the article reader.
///
/// Most color fields are iOS only at runtime.
/// Android equivalents are XML resource overrides in the host app.
class ArticleSettingsUIConfig {
  /// Creates an article settings UI config.
  const ArticleSettingsUIConfig({
    this.backgroundColor,
    this.overlayBackgroundColor,
    this.fontSizeEnabledColor,
    this.fontSizeDisabledColor,
    this.lineSpacingEnabledColor,
    this.lineSpacingDisabledColor,
    this.userInterfaceStyleBorderColor,
    this.userInterfaceStyleBorderSelectedColor,
    this.brightnessImagesColor,
    this.brightnessMinColor,
    this.brightnessMaxColor,
    this.separatorColor,
    this.selectedTintColor,
    this.disabledTintColor,
  });

  /// The background color. iOS only.
  final MilibrisColor? backgroundColor;

  /// The background color of the overlay.
  ///
  /// iOS: `colors.overlayBackground`
  /// Android: `or_content_black_opacity_60` (XML)
  final MilibrisColor? overlayBackgroundColor;

  /// The color of font size buttons when enabled.
  ///
  /// iOS: `colors.fontSizeEnabled`
  /// Android: `or_articles_personalize_text_size_button_tint` (XML)
  final MilibrisColor? fontSizeEnabledColor;

  /// The color of font size buttons when disabled.
  ///
  /// iOS: `colors.fontSizeDisabled`
  /// Android: disabled state of the same selector (XML)
  final MilibrisColor? fontSizeDisabledColor;

  /// The color of line spacing buttons when enabled.
  ///
  /// iOS: `colors.lineSpacingEnabled`
  /// Android: `or_articles_personalize_line_spacing_button_tint` (XML)
  final MilibrisColor? lineSpacingEnabledColor;

  /// The color of line spacing buttons when disabled.
  ///
  /// iOS: `colors.lineSpacingDisabled`
  /// Android: disabled state of the same selector (XML)
  final MilibrisColor? lineSpacingDisabledColor;

  /// The border color of UI style buttons when not selected.
  ///
  /// iOS: `colors.userInterfaceStyleBorder`
  /// Android: `or_display_mode_stroke_color` (XML)
  final MilibrisColor? userInterfaceStyleBorderColor;

  /// The border color of UI style buttons when selected. iOS only.
  final MilibrisColor? userInterfaceStyleBorderSelectedColor;

  /// The color applied to brightness control images.
  ///
  /// iOS: `colors.brightnessImages`
  /// Android: `or_articles_bottom_button_tint_default` (XML)
  final MilibrisColor? brightnessImagesColor;

  /// The color applied to the minimum part of the brightness control.
  ///
  /// iOS: `colors.brightnessMin`
  /// Android: `or_articles_personalize_brightness_thumb` (XML)
  final MilibrisColor? brightnessMinColor;

  /// The color applied to the maximum part of the brightness control.
  ///
  /// iOS: `colors.brightnessMax`
  /// Android: `or_articles_personalize_brightness_seekbar_background` (XML)
  final MilibrisColor? brightnessMaxColor;

  /// The separator color. iOS only.
  final MilibrisColor? separatorColor;

  /// The tint applied to the personalise icon when settings is open.
  ///
  /// Android only: `or_articles_bottom_button_tint_selected_light/dark` (XML)
  final MilibrisColor? selectedTintColor;

  /// The tint applied to other buttons when settings is open.
  ///
  /// Android only: `or_articles_bottom_button_tint_disabled_light/dark` (XML)
  final MilibrisColor? disabledTintColor;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (backgroundColor != null)
      'backgroundColor': backgroundColor!.toMap(),
    if (overlayBackgroundColor != null)
      'overlayBackgroundColor': overlayBackgroundColor!.toMap(),
    if (fontSizeEnabledColor != null)
      'fontSizeEnabledColor': fontSizeEnabledColor!.toMap(),
    if (fontSizeDisabledColor != null)
      'fontSizeDisabledColor': fontSizeDisabledColor!.toMap(),
    if (lineSpacingEnabledColor != null)
      'lineSpacingEnabledColor': lineSpacingEnabledColor!.toMap(),
    if (lineSpacingDisabledColor != null)
      'lineSpacingDisabledColor': lineSpacingDisabledColor!.toMap(),
    if (userInterfaceStyleBorderColor != null)
      'userInterfaceStyleBorderColor':
          userInterfaceStyleBorderColor!.toMap(),
    if (userInterfaceStyleBorderSelectedColor != null)
      'userInterfaceStyleBorderSelectedColor':
          userInterfaceStyleBorderSelectedColor!.toMap(),
    if (brightnessImagesColor != null)
      'brightnessImagesColor': brightnessImagesColor!.toMap(),
    if (brightnessMinColor != null)
      'brightnessMinColor': brightnessMinColor!.toMap(),
    if (brightnessMaxColor != null)
      'brightnessMaxColor': brightnessMaxColor!.toMap(),
    if (separatorColor != null) 'separatorColor': separatorColor!.toMap(),
    if (selectedTintColor != null)
      'selectedTintColor': selectedTintColor!.toMap(),
    if (disabledTintColor != null)
      'disabledTintColor': disabledTintColor!.toMap(),
  };
}
