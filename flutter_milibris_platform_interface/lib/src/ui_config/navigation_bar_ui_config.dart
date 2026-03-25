// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for the reader navigation bar.
///
/// Used in [ReaderUIConfig], [SummaryUIConfig], and [ArticleReaderUIConfig].
/// Logo is the only field applied on Android at runtime; all other fields are
/// iOS only (Android via XML resource overrides).
class NavigationBarUIConfig {
  /// Creates a navigation bar UI config.
  const NavigationBarUIConfig({
    this.backgroundColor,
    this.buttonTint,
    this.titleColor,
    this.subtitleColor,
    this.progressBarBackgroundColor,
    this.progressBarFillColor,
    this.logoBackgroundColor,
    this.logoBorderColor,
    this.searchBarTint,
    this.logoImageName,
    this.titleFont,
    this.subtitleFont,
    this.searchBarTextFont,
  });

  /// The background color of the navigation bar.
  ///
  /// iOS: `colors.background` — Android: `or_toolbar_background_color_light/dark`
  final MilibrisColor? backgroundColor;

  /// The color applied to navigation bar buttons.
  ///
  /// iOS: `colors.buttonsTint` — Android: `or_navigation_button_tint_light/dark`
  final MilibrisColor? buttonTint;

  /// The text color of the title.
  ///
  /// iOS: `colors.titleText` — Android: `or_toolbar_title_text_light/dark`
  final MilibrisColor? titleColor;

  /// The text color of the subtitle.
  ///
  /// iOS: `colors.subtitleText` — Android: `or_toolbar_subtitle_text_light/dark`
  final MilibrisColor? subtitleColor;

  /// The background (non-filled) color of the progress bar.
  ///
  /// iOS: `colors.progressbarBackground`
  /// Android: `or_progress_background_color`
  final MilibrisColor? progressBarBackgroundColor;

  /// The filled color of the progress bar.
  ///
  /// iOS: `colors.progressbarFill` — Android: `or_progress_color`
  final MilibrisColor? progressBarFillColor;

  /// The background color of the logo capsule.
  ///
  /// iOS: `colors.logoBackground` — Android: `or_logo_capsule_color_light/dark`
  final MilibrisColor? logoBackgroundColor;

  /// The border color of the logo capsule. iOS only.
  final MilibrisColor? logoBorderColor;

  /// The tint color of the search bar. iOS only.
  final MilibrisColor? searchBarTint;

  /// The native image name for the brand logo.
  ///
  /// On iOS, resolved via `UIImage(named:)` from the host app's asset catalog.
  /// On Android, resolved via `Resources.getIdentifier()` as a drawable
  /// resource.
  ///
  /// Both platforms: provide the same resource name or use `Platform.isIOS`
  /// to pass platform-specific names.
  final String? logoImageName;

  /// The font of the title. iOS only.
  final MilibrisFont? titleFont;

  /// The font of the subtitle. iOS only.
  final MilibrisFont? subtitleFont;

  /// The font of the search bar text. iOS only.
  final MilibrisFont? searchBarTextFont;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (backgroundColor != null) 'backgroundColor': backgroundColor!.toMap(),
    if (buttonTint != null) 'buttonTint': buttonTint!.toMap(),
    if (titleColor != null) 'titleColor': titleColor!.toMap(),
    if (subtitleColor != null) 'subtitleColor': subtitleColor!.toMap(),
    if (progressBarBackgroundColor != null)
      'progressBarBackgroundColor': progressBarBackgroundColor!.toMap(),
    if (progressBarFillColor != null)
      'progressBarFillColor': progressBarFillColor!.toMap(),
    if (logoBackgroundColor != null)
      'logoBackgroundColor': logoBackgroundColor!.toMap(),
    if (logoBorderColor != null) 'logoBorderColor': logoBorderColor!.toMap(),
    if (searchBarTint != null) 'searchBarTint': searchBarTint!.toMap(),
    if (logoImageName != null) 'logoImageName': logoImageName,
    if (titleFont != null) 'titleFont': titleFont!.toMap(),
    if (subtitleFont != null) 'subtitleFont': subtitleFont!.toMap(),
    if (searchBarTextFont != null)
      'searchBarTextFont': searchBarTextFont!.toMap(),
  };
}
