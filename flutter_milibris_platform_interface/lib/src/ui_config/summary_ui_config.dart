import 'package:flutter_milibris_platform_interface/src/ui_config/navigation_bar_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for the full-screen summary.
///
/// Most color/font fields are iOS only at runtime.
/// Android equivalents are XML resource overrides in the host app.
class SummaryUIConfig {
  /// Creates a summary UI config.
  const SummaryUIConfig({
    this.navigationBar,
    this.isFaceCropEnabled,
    this.backgroundColor,
    this.rubricBackgroundColor,
    this.rubricTextColor,
    this.cellTitleColor,
    this.cellSubtitleColor,
    this.cellFooterColor,
    this.imagePlaceholderColor,
    this.separatorColor,
    this.selectedBackgroundColor,
    this.overlayBackgroundColor,
    this.rubricPlaceholderColor,
    this.cellPlaceholderColor,
    this.rubricFont,
    this.cellTitleFont,
    this.cellSubtitleFont,
    this.cellFooterFont,
  });

  /// The config for the summary navigation bar. iOS only.
  final NavigationBarUIConfig? navigationBar;

  /// Enable on-device smart crop for images.
  ///
  /// Both platforms. Android: `isFaceCropEnabled` on `ReaderSettings`.
  final bool? isFaceCropEnabled;

  /// The background color of the summary screen. iOS only.
  final MilibrisColor? backgroundColor;

  /// The background color of rubric views.
  ///
  /// iOS: `colors.rubricBackground`
  /// Android: `or_rubric_selected_background_light/dark` (XML)
  final MilibrisColor? rubricBackgroundColor;

  /// The text color of rubric views.
  ///
  /// iOS: `colors.rubricText`
  /// Android: `or_rubric_tint_light/dark` (XML)
  final MilibrisColor? rubricTextColor;

  /// The color of the title in article cells.
  ///
  /// iOS: `colors.cellTitleText`
  /// Android: `or_summary_article_title_tint_light/dark` (XML)
  final MilibrisColor? cellTitleColor;

  /// The color of the subtitle in article cells.
  ///
  /// iOS: `colors.cellSubtitleText`
  /// Android: `or_summary_article_subtitle_tint_light/dark` (XML)
  final MilibrisColor? cellSubtitleColor;

  /// The color of footer text (reading time) in article cells.
  ///
  /// iOS: `colors.cellFooterText`
  /// Android: `or_summary_article_reading_time_tint_light` (XML)
  final MilibrisColor? cellFooterColor;

  /// The background color of image views while loading.
  ///
  /// iOS: `colors.imagePlaceholder`
  /// Android: `or_holder_color` (XML)
  final MilibrisColor? imagePlaceholderColor;

  /// The cell separator color. iOS only.
  final MilibrisColor? separatorColor;

  /// The background color of selected cells. iOS only.
  final MilibrisColor? selectedBackgroundColor;

  /// The background color of the overlay. iOS only.
  final MilibrisColor? overlayBackgroundColor;

  /// The color of rubric placeholder while loading. iOS only.
  final MilibrisColor? rubricPlaceholderColor;

  /// The color of label placeholders while loading. iOS only.
  final MilibrisColor? cellPlaceholderColor;

  /// The font of rubric views. iOS only.
  final MilibrisFont? rubricFont;

  /// The font of the title in article cells. iOS only.
  final MilibrisFont? cellTitleFont;

  /// The font of the subtitle in article cells. iOS only.
  final MilibrisFont? cellSubtitleFont;

  /// The font of footer text in article cells. iOS only.
  final MilibrisFont? cellFooterFont;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (navigationBar != null) 'navigationBar': navigationBar!.toMap(),
    if (isFaceCropEnabled != null) 'isFaceCropEnabled': isFaceCropEnabled,
    if (backgroundColor != null)
      'backgroundColor': backgroundColor!.toMap(),
    if (rubricBackgroundColor != null)
      'rubricBackgroundColor': rubricBackgroundColor!.toMap(),
    if (rubricTextColor != null)
      'rubricTextColor': rubricTextColor!.toMap(),
    if (cellTitleColor != null)
      'cellTitleColor': cellTitleColor!.toMap(),
    if (cellSubtitleColor != null)
      'cellSubtitleColor': cellSubtitleColor!.toMap(),
    if (cellFooterColor != null)
      'cellFooterColor': cellFooterColor!.toMap(),
    if (imagePlaceholderColor != null)
      'imagePlaceholderColor': imagePlaceholderColor!.toMap(),
    if (separatorColor != null)
      'separatorColor': separatorColor!.toMap(),
    if (selectedBackgroundColor != null)
      'selectedBackgroundColor': selectedBackgroundColor!.toMap(),
    if (overlayBackgroundColor != null)
      'overlayBackgroundColor': overlayBackgroundColor!.toMap(),
    if (rubricPlaceholderColor != null)
      'rubricPlaceholderColor': rubricPlaceholderColor!.toMap(),
    if (cellPlaceholderColor != null)
      'cellPlaceholderColor': cellPlaceholderColor!.toMap(),
    if (rubricFont != null) 'rubricFont': rubricFont!.toMap(),
    if (cellTitleFont != null) 'cellTitleFont': cellTitleFont!.toMap(),
    if (cellSubtitleFont != null)
      'cellSubtitleFont': cellSubtitleFont!.toMap(),
    if (cellFooterFont != null) 'cellFooterFont': cellFooterFont!.toMap(),
  };
}
