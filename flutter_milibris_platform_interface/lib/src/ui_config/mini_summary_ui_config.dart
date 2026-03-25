import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for the mini summary bottom sheet of the reader.
///
/// Android only. On iOS, mini-summary colors are part of [ReaderUIConfig].
class MiniSummaryUIConfig {
  /// Creates a mini summary UI config.
  const MiniSummaryUIConfig({
    this.isFaceCropEnabled,
    this.loadingTintColor,
    this.cellTitleTextColor,
    this.backgroundColor,
    this.separatorColor,
  });

  /// Enable on-device smart crop for images. Android only.
  ///
  /// Android: `isFaceCropEnabled` on `MiniSummaryConfig`
  final bool? isFaceCropEnabled;

  /// The color of label placeholders while loading. Android only.
  ///
  /// Android: `or_mini_summary_loading_tint` (XML)
  final MilibrisColor? loadingTintColor;

  /// The color of cell titles. Android only.
  ///
  /// Android: `OneReaderFlatPlanArticleTitleTextView` style (XML)
  final MilibrisColor? cellTitleTextColor;

  /// The background color of the bottom sheet. Android only.
  ///
  /// Android: `or_flat_plan_background_color` (XML)
  final MilibrisColor? backgroundColor;

  /// The separator color. Android only.
  ///
  /// Android: `or_mini_summary_separator_light/dark` (XML)
  final MilibrisColor? separatorColor;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (isFaceCropEnabled != null) 'isFaceCropEnabled': isFaceCropEnabled,
    if (loadingTintColor != null)
      'loadingTintColor': loadingTintColor!.toMap(),
    if (cellTitleTextColor != null)
      'cellTitleTextColor': cellTitleTextColor!.toMap(),
    if (backgroundColor != null)
      'backgroundColor': backgroundColor!.toMap(),
    if (separatorColor != null) 'separatorColor': separatorColor!.toMap(),
  };
}
