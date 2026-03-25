// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for top-level reader behaviour and appearance.
///
/// Feature flags apply on both platforms at runtime.
/// Color/font fields are iOS only at runtime; Android equivalents are XML
/// resource overrides in the host app.
class ReaderUIConfig {
  /// Creates a reader UI config.
  const ReaderUIConfig({
    this.isSummaryEnabled,
    this.isPrintEnabled,
    this.isDoublePagesEnabled,
    this.longPressArticlesEnabled,
    this.debugBoxes,
    this.isFaceCropEnabled,
    this.isLandscapeOnly,
    this.showReaderTutorials,
    this.backgroundColor,
    this.boxHighlightColor,
    this.pagePlaceholderColor,
    this.articleCapsuleHiddenBackgroundColor,
    this.articleCapsuleHiddenTextColor,
    this.articleCapsuleBottomBackgroundColor,
    this.articleCapsuleBottomTextColor,
    this.actionButtonBackgroundColor,
    this.actionButtonTintColor,
    this.flatplanImagePlaceholderColor,
    this.flatplanSelectedBorderColor,
    this.flatplanSelectedTitleTextColor,
    this.flatplanTitleTextColor,
    this.bottomSheetDragIndicatorColor,
    this.bottomSheetBackgroundColor,
    this.miniSummaryCellTitleTextColor,
    this.miniSummaryCellPlaceholderColor,
    this.miniSummaryImagePlaceholderColor,
    this.miniSummarySeparatorColor,
    this.flatplanTitleFont,
    this.miniSummaryCellTitleFont,
    this.debugImageCrop,
    this.onDeviceSmartCropEnabled,
  });

  // ── Feature flags (both platforms) ────────────────────────────────────────

  /// Hide the summary button if false.
  ///
  /// iOS: `features.isSummaryEnabled`
  /// Android: `setSummaryEnabled` on `ReaderSettings`
  final bool? isSummaryEnabled;

  /// Add a print page button if true.
  ///
  /// iOS: `features.printPageEnabled`
  /// Android: `setPrintEnabled` on `ReaderSettings`
  final bool? isPrintEnabled;

  /// Display single pages even in landscape if false.
  ///
  /// iOS: `features.isDoublePagesEnabled`
  /// Android: `setEnabledDoublePage` on `ReaderSettings`
  final bool? isDoublePagesEnabled;

  /// Enable the long press gesture to open articles.
  ///
  /// iOS: `features.longPressArticlesEnabled`
  /// Android: `setShouldEnableLongPressOnArticles` on `ReaderSettings`
  final bool? longPressArticlesEnabled;

  /// Display boxes position with a transparent overlay.
  ///
  /// iOS: `features.debugBoxes`
  /// Android: `setDebugBoxes` on `ReaderSettings`
  final bool? debugBoxes;

  /// Enable on-device smart crop for images.
  ///
  /// iOS: `features.onDeviceSmartCropEnabled`
  /// Android: `setFaceCropEnabled` on `ReaderSettings`
  final bool? isFaceCropEnabled;

  /// Always open the reader in landscape. Android only.
  ///
  /// Android: `setLandscapeOnly` on `ReaderSettings`
  final bool? isLandscapeOnly;

  /// Show the reader tutorial on first launch. Android only.
  ///
  /// Android: `setShowReaderTutorials` on `ReaderSettings`
  final bool? showReaderTutorials;

  // ── Colors (iOS only at runtime) ───────────────────────────────────────────

  /// The background color.
  ///
  /// iOS: `colors.background`
  /// Android: `or_background_color` (XML)
  final MilibrisColor? backgroundColor;

  /// The color used to highlight boxes on page turn.
  ///
  /// iOS: `colors.boxHighlight`
  /// Android: `or_box_color` (XML)
  final MilibrisColor? boxHighlightColor;

  /// The background color of pages while loading.
  ///
  /// iOS: `colors.pagePlaceholder`
  /// Android: `or_page_view_holder_color` (XML)
  final MilibrisColor? pagePlaceholderColor;

  /// The background color of the article capsule (bottom sheet hidden).
  ///
  /// iOS: `colors.articleCapsuleHiddenBackground`
  /// Android: `available_articles_indicator_start_bg_color` (XML)
  final MilibrisColor? articleCapsuleHiddenBackgroundColor;

  /// The text color of the article capsule (bottom sheet hidden).
  ///
  /// iOS: `colors.articleCapsuleHiddenText`
  /// Android: `available_articles_indicator_start_text_color` (XML)
  final MilibrisColor? articleCapsuleHiddenTextColor;

  /// The background color of the article capsule (bottom sheet bottom).
  ///
  /// iOS: `colors.articleCapsuleBottomBackground`
  /// Android: `available_articles_indicator_end_bg_color` (XML)
  final MilibrisColor? articleCapsuleBottomBackgroundColor;

  /// The text color of the article capsule (bottom sheet bottom).
  ///
  /// iOS: `colors.articleCapsuleBottomText`
  /// Android: `available_articles_indicator_end_text_color` (XML)
  final MilibrisColor? articleCapsuleBottomTextColor;

  /// The background color of action buttons on pages. iOS only.
  final MilibrisColor? actionButtonBackgroundColor;

  /// The tint color of action buttons on pages. iOS only.
  final MilibrisColor? actionButtonTintColor;

  /// The background color of flatplan images while loading.
  ///
  /// iOS: `colors.flatplanImagePlaceholder`
  /// Android: `or_flat_plan_holder_color` (XML)
  final MilibrisColor? flatplanImagePlaceholderColor;

  /// The border color in the flatplan when selected.
  ///
  /// iOS: `colors.flatplanSelectedBorder`
  /// Android: `or_flat_plan_selected_color` (XML)
  final MilibrisColor? flatplanSelectedBorderColor;

  /// The text color in the flatplan when selected.
  ///
  /// iOS: `colors.flatplanSelectedTitleText`
  /// Android: `or_flat_plan_selected_color` (XML)
  final MilibrisColor? flatplanSelectedTitleTextColor;

  /// The text color in the flatplan when not selected.
  ///
  /// iOS: `colors.flatplanTitleText`
  /// Android: `or_flat_plan_text_color` (XML)
  final MilibrisColor? flatplanTitleTextColor;

  /// The color of the bottom sheet drag indicator.
  ///
  /// iOS: `colors.bottomSheetDragIndicator`
  /// Android: `or_flat_plan_line_color` (XML)
  final MilibrisColor? bottomSheetDragIndicatorColor;

  /// The background color of the bottom sheet. iOS only.
  final MilibrisColor? bottomSheetBackgroundColor;

  /// The cell title color in the mini-summary. iOS only.
  final MilibrisColor? miniSummaryCellTitleTextColor;

  /// The label placeholder color in the mini-summary while loading. iOS only.
  final MilibrisColor? miniSummaryCellPlaceholderColor;

  /// The image placeholder color in the mini-summary. iOS only.
  final MilibrisColor? miniSummaryImagePlaceholderColor;

  /// The separator color in the mini-summary. iOS only.
  final MilibrisColor? miniSummarySeparatorColor;

  // ── Fonts (iOS only at runtime) ────────────────────────────────────────────

  /// The font of text in the flatplan. iOS only.
  final MilibrisFont? flatplanTitleFont;

  /// The font of cell titles in the mini-summary. iOS only.
  final MilibrisFont? miniSummaryCellTitleFont;

  // ── iOS-specific debug ─────────────────────────────────────────────────────

  /// Display rectangles on images previewing image crop. iOS only.
  final bool? debugImageCrop;

  /// Enable on-device smart crop for images. iOS only.
  ///
  /// This is a separate iOS-specific flag from [isFaceCropEnabled].
  /// iOS: `features.onDeviceSmartCropEnabled` at the reader level.
  final bool? onDeviceSmartCropEnabled;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (isSummaryEnabled != null) 'isSummaryEnabled': isSummaryEnabled,
    if (isPrintEnabled != null) 'isPrintEnabled': isPrintEnabled,
    if (isDoublePagesEnabled != null)
      'isDoublePagesEnabled': isDoublePagesEnabled,
    if (longPressArticlesEnabled != null)
      'longPressArticlesEnabled': longPressArticlesEnabled,
    if (debugBoxes != null) 'debugBoxes': debugBoxes,
    if (isFaceCropEnabled != null) 'isFaceCropEnabled': isFaceCropEnabled,
    if (isLandscapeOnly != null) 'isLandscapeOnly': isLandscapeOnly,
    if (showReaderTutorials != null) 'showReaderTutorials': showReaderTutorials,
    if (backgroundColor != null) 'backgroundColor': backgroundColor!.toMap(),
    if (boxHighlightColor != null)
      'boxHighlightColor': boxHighlightColor!.toMap(),
    if (pagePlaceholderColor != null)
      'pagePlaceholderColor': pagePlaceholderColor!.toMap(),
    if (articleCapsuleHiddenBackgroundColor != null)
      'articleCapsuleHiddenBackgroundColor':
          articleCapsuleHiddenBackgroundColor!.toMap(),
    if (articleCapsuleHiddenTextColor != null)
      'articleCapsuleHiddenTextColor': articleCapsuleHiddenTextColor!.toMap(),
    if (articleCapsuleBottomBackgroundColor != null)
      'articleCapsuleBottomBackgroundColor':
          articleCapsuleBottomBackgroundColor!.toMap(),
    if (articleCapsuleBottomTextColor != null)
      'articleCapsuleBottomTextColor': articleCapsuleBottomTextColor!.toMap(),
    if (actionButtonBackgroundColor != null)
      'actionButtonBackgroundColor': actionButtonBackgroundColor!.toMap(),
    if (actionButtonTintColor != null)
      'actionButtonTintColor': actionButtonTintColor!.toMap(),
    if (flatplanImagePlaceholderColor != null)
      'flatplanImagePlaceholderColor': flatplanImagePlaceholderColor!.toMap(),
    if (flatplanSelectedBorderColor != null)
      'flatplanSelectedBorderColor': flatplanSelectedBorderColor!.toMap(),
    if (flatplanSelectedTitleTextColor != null)
      'flatplanSelectedTitleTextColor': flatplanSelectedTitleTextColor!.toMap(),
    if (flatplanTitleTextColor != null)
      'flatplanTitleTextColor': flatplanTitleTextColor!.toMap(),
    if (bottomSheetDragIndicatorColor != null)
      'bottomSheetDragIndicatorColor': bottomSheetDragIndicatorColor!.toMap(),
    if (bottomSheetBackgroundColor != null)
      'bottomSheetBackgroundColor': bottomSheetBackgroundColor!.toMap(),
    if (miniSummaryCellTitleTextColor != null)
      'miniSummaryCellTitleTextColor': miniSummaryCellTitleTextColor!.toMap(),
    if (miniSummaryCellPlaceholderColor != null)
      'miniSummaryCellPlaceholderColor': miniSummaryCellPlaceholderColor!
          .toMap(),
    if (miniSummaryImagePlaceholderColor != null)
      'miniSummaryImagePlaceholderColor': miniSummaryImagePlaceholderColor!
          .toMap(),
    if (miniSummarySeparatorColor != null)
      'miniSummarySeparatorColor': miniSummarySeparatorColor!.toMap(),
    if (flatplanTitleFont != null)
      'flatplanTitleFont': flatplanTitleFont!.toMap(),
    if (miniSummaryCellTitleFont != null)
      'miniSummaryCellTitleFont': miniSummaryCellTitleFont!.toMap(),
    if (debugImageCrop != null) 'debugImageCrop': debugImageCrop,
    if (onDeviceSmartCropEnabled != null)
      'onDeviceSmartCropEnabled': onDeviceSmartCropEnabled,
  };
}
