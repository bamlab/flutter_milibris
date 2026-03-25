import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for slideshow media boxes.
///
/// Supported on both iOS and Android (Android via XML resource overrides).
class SlideshowBoxUIConfig {
  /// Creates a slideshow box UI config.
  const SlideshowBoxUIConfig({
    this.backgroundColor,
    this.captionBackgroundColor,
    this.captionTextColor,
    this.currentPageIndicatorColor,
    this.pageIndicatorColor,
    this.captionFont,
  });

  /// The background color.
  ///
  /// iOS: `colors.background`
  /// Android: `or_background_color` (XML)
  final MilibrisColor? backgroundColor;

  /// The background color of the caption.
  ///
  /// iOS: `colors.captionBackground`
  /// Android: `or_image_caption_bg_color` (XML)
  final MilibrisColor? captionBackgroundColor;

  /// The text color of the caption.
  ///
  /// iOS: `colors.captionText`
  /// Android: `or_image_caption_text_color` (XML)
  final MilibrisColor? captionTextColor;

  /// The color of the selected page indicator.
  ///
  /// iOS: `colors.currentPageIndicatorTint`
  /// Android: `or_indicator_active_color` (XML)
  final MilibrisColor? currentPageIndicatorColor;

  /// The color of page indicators.
  ///
  /// iOS: `colors.pageIndicatorTint`
  /// Android: `or_indicator_inactive_color` (XML)
  final MilibrisColor? pageIndicatorColor;

  /// The font of the caption. iOS only.
  final MilibrisFont? captionFont;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (backgroundColor != null)
      'backgroundColor': backgroundColor!.toMap(),
    if (captionBackgroundColor != null)
      'captionBackgroundColor': captionBackgroundColor!.toMap(),
    if (captionTextColor != null)
      'captionTextColor': captionTextColor!.toMap(),
    if (currentPageIndicatorColor != null)
      'currentPageIndicatorColor': currentPageIndicatorColor!.toMap(),
    if (pageIndicatorColor != null)
      'pageIndicatorColor': pageIndicatorColor!.toMap(),
    if (captionFont != null) 'captionFont': captionFont!.toMap(),
  };
}
