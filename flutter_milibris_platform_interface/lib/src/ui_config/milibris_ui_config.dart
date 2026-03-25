// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

import 'package:flutter_milibris_platform_interface/src/ui_config/alert_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/article_image_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/article_reader_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/article_settings_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/html_box_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/mini_summary_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/modal_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/navigation_bar_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/reader_tutorial_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/reader_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/slideshow_box_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/summary_ui_config.dart';

/// UI configuration for the Milibris reader.
///
/// Pass to [FlutterMilibris.open] to customise the reader appearance and
/// behaviour. Each field corresponds to a config section from the SDK docs.
/// All fields are optional — omit a section to keep the SDK's defaults.
///
/// Fields marked **iOS only** have no runtime effect on Android.
/// Fields marked **Android only** have no runtime effect on iOS.
/// Fields with no platform annotation apply to both platforms.
///
/// Android visual theming (colors, fonts) requires XML resource overrides in
/// the host app. See the `android_config.md` reference for resource names.
class MilibrisUIConfig {
  /// Creates a Milibris UI config.
  const MilibrisUIConfig({
    this.reader,
    this.navigationBar,
    this.summary,
    this.articleReader,
    this.articleSettings,
    this.readerTutorial,
    this.slideshowBox,
    this.alert,
    this.miniSummary,
    this.articleImage,
    this.htmlBox,
    this.modal,
  });

  /// Top-level reader feature flags and colours.
  final ReaderUIConfig? reader;

  /// The reader navigation bar.
  final NavigationBarUIConfig? navigationBar;

  /// The full-screen article summary.
  final SummaryUIConfig? summary;

  /// The in-article reader.
  final ArticleReaderUIConfig? articleReader;

  /// The font/brightness settings panel. iOS only.
  final ArticleSettingsUIConfig? articleSettings;

  /// The onboarding tutorial.
  final ReaderTutorialUIConfig? readerTutorial;

  /// Slideshow media boxes.
  final SlideshowBoxUIConfig? slideshowBox;

  /// Alert popins.
  final AlertUIConfig? alert;

  /// The mini summary bottom sheet. Android only.
  final MiniSummaryUIConfig? miniSummary;

  /// The full-screen image viewer. iOS only.
  final ArticleImageUIConfig? articleImage;

  /// HTML media boxes. iOS only.
  final HtmlBoxUIConfig? htmlBox;

  /// Modal screens (e.g. search). iOS only.
  final ModalUIConfig? modal;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (reader != null) 'reader': reader!.toMap(),
    if (navigationBar != null) 'navigationBar': navigationBar!.toMap(),
    if (summary != null) 'summary': summary!.toMap(),
    if (articleReader != null) 'articleReader': articleReader!.toMap(),
    if (articleSettings != null) 'articleSettings': articleSettings!.toMap(),
    if (readerTutorial != null) 'readerTutorial': readerTutorial!.toMap(),
    if (slideshowBox != null) 'slideshowBox': slideshowBox!.toMap(),
    if (alert != null) 'alert': alert!.toMap(),
    if (miniSummary != null) 'miniSummary': miniSummary!.toMap(),
    if (articleImage != null) 'articleImage': articleImage!.toMap(),
    if (htmlBox != null) 'htmlBox': htmlBox!.toMap(),
    if (modal != null) 'modal': modal!.toMap(),
  };
}
