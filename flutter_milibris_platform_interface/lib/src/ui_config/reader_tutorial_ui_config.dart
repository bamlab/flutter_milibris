// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for the reader onboarding tutorial.
///
/// Supported on both iOS and Android (Android via XML resource overrides).
class ReaderTutorialUIConfig {
  /// Creates a reader tutorial UI config.
  const ReaderTutorialUIConfig({
    this.overlayBackgroundColor,
    this.imageBackgroundColor,
    this.contentBackgroundColor,
    this.titleTextColor,
    this.descriptionTextColor,
    this.skipButtonTextColor,
    this.currentPageIndicatorColor,
    this.pageIndicatorColor,
    this.articleCapsuleBackgroundColor,
    this.articleCapsuleTextColor,
    this.titleFontBigPhone,
    this.titleFontBigTablet,
    this.titleFontRegular,
    this.descriptionFont,
    this.skipButtonFont,
    this.articleCapsuleFont,
  });

  /// The background color of the overlay.
  ///
  /// iOS: `colors.overlayBackground`
  /// Android: `or_tutorial_bg` (XML)
  final MilibrisColor? overlayBackgroundColor;

  /// The background color of item images.
  ///
  /// iOS: `colors.imageBackground`
  /// Android: `or_tutorial_bg` (XML, same key)
  final MilibrisColor? imageBackgroundColor;

  /// The background color of the content card. iOS only.
  final MilibrisColor? contentBackgroundColor;

  /// The text color of item titles. iOS only.
  final MilibrisColor? titleTextColor;

  /// The text color of item descriptions. iOS only.
  final MilibrisColor? descriptionTextColor;

  /// The text color of the skip button. iOS only.
  final MilibrisColor? skipButtonTextColor;

  /// The color of the selected page indicator.
  ///
  /// iOS: `colors.currentPageIndicatorTint`
  /// Android: `or_current_page_indicator` (XML)
  final MilibrisColor? currentPageIndicatorColor;

  /// The color of page indicators.
  ///
  /// iOS: `colors.pageIndicatorTint`
  /// Android: `or_page_indicator` (XML)
  final MilibrisColor? pageIndicatorColor;

  /// The background color of the article capsule. iOS only.
  final MilibrisColor? articleCapsuleBackgroundColor;

  /// The text color of the article capsule. iOS only.
  final MilibrisColor? articleCapsuleTextColor;

  /// The font of item titles (big, phone). iOS only.
  final MilibrisFont? titleFontBigPhone;

  /// The font of item titles (big, tablet). iOS only.
  final MilibrisFont? titleFontBigTablet;

  /// The font of item titles (regular). iOS only.
  final MilibrisFont? titleFontRegular;

  /// The font of item descriptions. iOS only.
  final MilibrisFont? descriptionFont;

  /// The font of the skip button. iOS only.
  final MilibrisFont? skipButtonFont;

  /// The font of the article capsule. iOS only.
  final MilibrisFont? articleCapsuleFont;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (overlayBackgroundColor != null)
      'overlayBackgroundColor': overlayBackgroundColor!.toMap(),
    if (imageBackgroundColor != null)
      'imageBackgroundColor': imageBackgroundColor!.toMap(),
    if (contentBackgroundColor != null)
      'contentBackgroundColor': contentBackgroundColor!.toMap(),
    if (titleTextColor != null) 'titleTextColor': titleTextColor!.toMap(),
    if (descriptionTextColor != null)
      'descriptionTextColor': descriptionTextColor!.toMap(),
    if (skipButtonTextColor != null)
      'skipButtonTextColor': skipButtonTextColor!.toMap(),
    if (currentPageIndicatorColor != null)
      'currentPageIndicatorColor': currentPageIndicatorColor!.toMap(),
    if (pageIndicatorColor != null)
      'pageIndicatorColor': pageIndicatorColor!.toMap(),
    if (articleCapsuleBackgroundColor != null)
      'articleCapsuleBackgroundColor': articleCapsuleBackgroundColor!.toMap(),
    if (articleCapsuleTextColor != null)
      'articleCapsuleTextColor': articleCapsuleTextColor!.toMap(),
    if (titleFontBigPhone != null)
      'titleFontBigPhone': titleFontBigPhone!.toMap(),
    if (titleFontBigTablet != null)
      'titleFontBigTablet': titleFontBigTablet!.toMap(),
    if (titleFontRegular != null) 'titleFontRegular': titleFontRegular!.toMap(),
    if (descriptionFont != null) 'descriptionFont': descriptionFont!.toMap(),
    if (skipButtonFont != null) 'skipButtonFont': skipButtonFont!.toMap(),
    if (articleCapsuleFont != null)
      'articleCapsuleFont': articleCapsuleFont!.toMap(),
  };
}
