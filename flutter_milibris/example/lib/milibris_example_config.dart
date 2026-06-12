// ignore_for_file: no-magic-string

import 'package:flutter_milibris/flutter_milibris_config.dart';

/// Builds the Milibris UI config for the example app.
///
/// Pass explicit [MilibrisColor] values to override the defaults. This keeps
/// the function Flutter-free so the Android color generator tool can call it
/// without a [BuildContext]:
///
///   dart run tool/generate_android_colors.dart
/// ```
const milibrisUIConfig = MilibrisUIConfig(
  reader: ReaderUIConfig(
    isSummaryEnabled: false,
    isPrintEnabled: true,
    isDoublePagesEnabled: true,
    longPressArticlesEnabled: true,
    debugBoxes: false,
    isFaceCropEnabled: true,
    isLandscapeOnly: false,
    showReaderTutorials: true,
    debugImageCrop: false,
    onDeviceSmartCropEnabled: true,
  ),
  navigationBar: NavigationBarUIConfig(
    logoImageName: 'logo',
    backgroundColor: MilibrisColor(0xFFFFFFFF, dark: 0xFF1C1C1E),
    logoBackgroundColor: MilibrisColor(0xFFFFFFFF),
    logoBorderColor: MilibrisColor(0xFFFFFFFF),
    subtitleColor: MilibrisColor(0x00000000),
  ),
  summary: SummaryUIConfig(),
  articleReader: ArticleReaderUIConfig(
    navigationBar: NavigationBarUIConfig(
      logoImageName: 'logo',
      backgroundColor: MilibrisColor(0xFFFFFFFF, dark: 0xFF1C1C1E),
      logoBackgroundColor: MilibrisColor(0xFFFFFFFF),
      logoBorderColor: MilibrisColor(0xFFFFFFFF),
      subtitleColor: MilibrisColor(0x00000000),
    ),
    isSummaryEnabled: false,
    isImageCropEnabled: false,
    isTextToSpeechEnabled: true,
    rubricBackgroundColor: MilibrisColor(0xFFFF0000),
    rubricTextColor: MilibrisColor(0xFFFFFFFF),
    rubricBackgroundOverPrimeImageColor: MilibrisColor(0xFFFF0000),
    rubricTextOverPrimeImageColor: MilibrisColor(0xFFFFFFFF),
    bottomBarBackgroundColor: MilibrisColor(0xFFFFFFFF, dark: 0xFF1C1C1E),
    // Brand font families (iOS only). Applied before the per-element overrides
    // below, so those still take precedence.
    primaryFont: MilibrisPrimaryFont(
      regular: 'LibeSans-Regular',
      black: 'LibeSans-Black',
      bold: 'LibeSans-Bold',
    ),
    secondaryFont: MilibrisSecondaryFont(regular: 'Georgia'),
    tertiaryFont: MilibrisTertiaryFont(regular: 'Georgia'),
    // Inline-run fonts within paragraphs (iOS only).
    paragraphBoldFont: MilibrisFont(name: 'Georgia-Bold', size: 18),
    paragraphStrongFont: MilibrisFont(name: 'Georgia-Bold', size: 18),
  ),
);
