// ignore_for_file: prefer-null-aware-elements, avoid-non-null-assertion

import 'package:flutter_milibris_platform_interface/src/ui_config/alert_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/article_image_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/article_settings_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/navigation_bar_ui_config.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';

/// Config for the article reader.
///
/// Most color/font/text fields are iOS only at runtime.
/// Android equivalents are XML resource overrides in the host app.
class ArticleReaderUIConfig {
  /// Creates an article reader UI config.
  const ArticleReaderUIConfig({
    this.navigationBar,
    this.alert,
    this.articleSettings,
    this.articleImage,
    this.isSummaryEnabled,
    this.isTextToSpeechEnabled,
    this.isAudioEnabled,
    this.isImageCropEnabled,
    this.onDeviceSmartCropEnabled,
    this.backgroundColor,
    this.bottomBarBackgroundColor,
    this.bottomBarTint,
    this.fisheyeLabelBackgroundColor,
    this.fisheyeLabelTextColor,
    this.rubricBackgroundColor,
    this.rubricTextColor,
    this.rubricBackgroundOverPrimeImageColor,
    this.rubricTextOverPrimeImageColor,
    this.primeImageGradientColor,
    this.primeImageContentColor,
    this.sectionBackgroundColor,
    this.linkColor,
    this.imagePlaceholderColor,
    this.separatorColor,
    this.nextArticleArrowColor,
    this.fisheyeLabelFont,
    this.bottomBarFont,
    this.rubricFont,
    this.paragraph,
    this.interTitle,
    this.title,
    this.titleTablet,
    this.subtitle,
    this.surtitle,
    this.author,
    this.caption,
    this.captionOverImage,
    this.credit,
    this.creditOverImage,
    this.note,
    this.heading,
    this.quote,
    this.quoteAuthor,
    this.nextArticleTitle,
    this.nextArticleInfos,
    this.interviewQuestion,
    this.interviewAnswer,
  });

  /// The config for the article reader navigation bar.
  final NavigationBarUIConfig? navigationBar;

  /// The config for alerts displayed by the article reader. iOS only.
  final AlertUIConfig? alert;

  /// The config for the article settings panel. iOS only.
  final ArticleSettingsUIConfig? articleSettings;

  /// The config for the full-screen image viewer. iOS only.
  final ArticleImageUIConfig? articleImage;

  /// Hide the summary button if false.
  ///
  /// Both platforms. iOS: `features.isSummaryEnabled`
  final bool? isSummaryEnabled;

  /// Enable text-to-speech feature.
  ///
  /// Both platforms. iOS: `features.isTextToSpeechEnabled`
  /// Android: `setTextToSpeechEnabled` on `ReaderSettings`.
  final bool? isTextToSpeechEnabled;

  /// Hide the audio button if false. iOS only.
  final bool? isAudioEnabled;

  /// Enable or disable image cropping in article content. iOS only.
  final bool? isImageCropEnabled;

  /// Enable on-device smart crop for images. iOS only.
  final bool? onDeviceSmartCropEnabled;

  /// The background color of the article reader. iOS only.
  final MilibrisColor? backgroundColor;

  /// The background color of the bottom bar.
  ///
  /// iOS: `colors.bottomBarBackground`
  /// Android: `or_articles_bottom_button_background_light/dark` (XML)
  final MilibrisColor? bottomBarBackgroundColor;

  /// The color applied to controls on the bottom bar.
  ///
  /// iOS: `colors.bottomBarTint`
  /// Android: `or_articles_bottom_button_tint_default_light/dark` (XML)
  final MilibrisColor? bottomBarTint;

  /// The background color of the fisheye label.
  ///
  /// iOS: `colors.fisheyeLabelBackground`
  /// Android: `cor_fish_eye_background` (XML)
  final MilibrisColor? fisheyeLabelBackgroundColor;

  /// The text color of the fisheye label.
  ///
  /// iOS: `colors.fisheyeLabelText`
  /// Android: `or_fish_eye_text_color` (XML)
  final MilibrisColor? fisheyeLabelTextColor;

  /// The background color of rubric views. iOS only.
  final MilibrisColor? rubricBackgroundColor;

  /// The text color of rubric views. iOS only.
  final MilibrisColor? rubricTextColor;

  /// The background color of rubric views over the prime image. iOS only.
  final MilibrisColor? rubricBackgroundOverPrimeImageColor;

  /// The text color of rubric views over the prime image. iOS only.
  final MilibrisColor? rubricTextOverPrimeImageColor;

  /// The color used for the prime image gradient. iOS only.
  final MilibrisColor? primeImageGradientColor;

  /// The color used for content displayed over the prime image. iOS only.
  final MilibrisColor? primeImageContentColor;

  /// The background color of article sections.
  ///
  /// iOS: `colors.sectionBackground`
  /// Android: `or_article_section_bg_light/dark` (XML)
  final MilibrisColor? sectionBackgroundColor;

  /// The color of links in text. iOS only.
  final MilibrisColor? linkColor;

  /// The background color of image views while loading. iOS only.
  final MilibrisColor? imagePlaceholderColor;

  /// The color of separators in content. iOS only.
  final MilibrisColor? separatorColor;

  /// The color for the arrow of the next article block. iOS only.
  final MilibrisColor? nextArticleArrowColor;

  /// The font for the fisheye label. iOS only.
  final MilibrisFont? fisheyeLabelFont;

  /// The font for bottom bar text. iOS only.
  final MilibrisFont? bottomBarFont;

  /// The font for rubric views. iOS only.
  final MilibrisFont? rubricFont;

  /// Text config for paragraphs. iOS only.
  final MilibrisTextConfig? paragraph;

  /// Text config for inter-titles. iOS only.
  final MilibrisTextConfig? interTitle;

  /// Text config for the article title on phones. iOS only.
  final MilibrisTextConfig? title;

  /// Text config for the article title on tablets. iOS only.
  final MilibrisTextConfig? titleTablet;

  /// Text config for the subtitle. iOS only.
  final MilibrisTextConfig? subtitle;

  /// Text config for the surtitle. iOS only.
  final MilibrisTextConfig? surtitle;

  /// Text config for the author. iOS only.
  final MilibrisTextConfig? author;

  /// Text config for image captions. iOS only.
  final MilibrisTextConfig? caption;

  /// Text config for captions displayed over images. iOS only.
  final MilibrisTextConfig? captionOverImage;

  /// Text config for image credits. iOS only.
  final MilibrisTextConfig? credit;

  /// Text config for credits displayed over images. iOS only.
  final MilibrisTextConfig? creditOverImage;

  /// Text config for notes. iOS only.
  final MilibrisTextConfig? note;

  /// Text config for headings. iOS only.
  final MilibrisTextConfig? heading;

  /// Text config for quotes. iOS only.
  final MilibrisTextConfig? quote;

  /// Text config for quote authors. iOS only.
  final MilibrisTextConfig? quoteAuthor;

  /// Text config for the title in the next article block. iOS only.
  final MilibrisTextConfig? nextArticleTitle;

  /// Text config for the info label in the next article block. iOS only.
  final MilibrisTextConfig? nextArticleInfos;

  /// Text config for interview questions. iOS only.
  final MilibrisTextConfig? interviewQuestion;

  /// Text config for interview answers. iOS only.
  final MilibrisTextConfig? interviewAnswer;

  /// Serializes this config to a map for cross-platform transport.
  Map<String, dynamic> toMap() => {
    if (navigationBar != null) 'navigationBar': navigationBar!.toMap(),
    if (alert != null) 'alert': alert!.toMap(),
    if (articleSettings != null) 'articleSettings': articleSettings!.toMap(),
    if (articleImage != null) 'articleImage': articleImage!.toMap(),
    if (isSummaryEnabled != null) 'isSummaryEnabled': isSummaryEnabled,
    if (isTextToSpeechEnabled != null)
      'isTextToSpeechEnabled': isTextToSpeechEnabled,
    if (isAudioEnabled != null) 'isAudioEnabled': isAudioEnabled,
    if (isImageCropEnabled != null) 'isImageCropEnabled': isImageCropEnabled,
    if (onDeviceSmartCropEnabled != null)
      'onDeviceSmartCropEnabled': onDeviceSmartCropEnabled,
    if (backgroundColor != null) 'backgroundColor': backgroundColor!.toMap(),
    if (bottomBarBackgroundColor != null)
      'bottomBarBackgroundColor': bottomBarBackgroundColor!.toMap(),
    if (bottomBarTint != null) 'bottomBarTint': bottomBarTint!.toMap(),
    if (fisheyeLabelBackgroundColor != null)
      'fisheyeLabelBackgroundColor': fisheyeLabelBackgroundColor!.toMap(),
    if (fisheyeLabelTextColor != null)
      'fisheyeLabelTextColor': fisheyeLabelTextColor!.toMap(),
    if (rubricBackgroundColor != null)
      'rubricBackgroundColor': rubricBackgroundColor!.toMap(),
    if (rubricTextColor != null) 'rubricTextColor': rubricTextColor!.toMap(),
    if (rubricBackgroundOverPrimeImageColor != null)
      'rubricBackgroundOverPrimeImageColor':
          rubricBackgroundOverPrimeImageColor!.toMap(),
    if (rubricTextOverPrimeImageColor != null)
      'rubricTextOverPrimeImageColor': rubricTextOverPrimeImageColor!.toMap(),
    if (primeImageGradientColor != null)
      'primeImageGradientColor': primeImageGradientColor!.toMap(),
    if (primeImageContentColor != null)
      'primeImageContentColor': primeImageContentColor!.toMap(),
    if (sectionBackgroundColor != null)
      'sectionBackgroundColor': sectionBackgroundColor!.toMap(),
    if (linkColor != null) 'linkColor': linkColor!.toMap(),
    if (imagePlaceholderColor != null)
      'imagePlaceholderColor': imagePlaceholderColor!.toMap(),
    if (separatorColor != null) 'separatorColor': separatorColor!.toMap(),
    if (nextArticleArrowColor != null)
      'nextArticleArrowColor': nextArticleArrowColor!.toMap(),
    if (fisheyeLabelFont != null) 'fisheyeLabelFont': fisheyeLabelFont!.toMap(),
    if (bottomBarFont != null) 'bottomBarFont': bottomBarFont!.toMap(),
    if (rubricFont != null) 'rubricFont': rubricFont!.toMap(),
    if (paragraph != null) 'paragraph': paragraph!.toMap(),
    if (interTitle != null) 'interTitle': interTitle!.toMap(),
    if (title != null) 'title': title!.toMap(),
    if (titleTablet != null) 'titleTablet': titleTablet!.toMap(),
    if (subtitle != null) 'subtitle': subtitle!.toMap(),
    if (surtitle != null) 'surtitle': surtitle!.toMap(),
    if (author != null) 'author': author!.toMap(),
    if (caption != null) 'caption': caption!.toMap(),
    if (captionOverImage != null) 'captionOverImage': captionOverImage!.toMap(),
    if (credit != null) 'credit': credit!.toMap(),
    if (creditOverImage != null) 'creditOverImage': creditOverImage!.toMap(),
    if (note != null) 'note': note!.toMap(),
    if (heading != null) 'heading': heading!.toMap(),
    if (quote != null) 'quote': quote!.toMap(),
    if (quoteAuthor != null) 'quoteAuthor': quoteAuthor!.toMap(),
    if (nextArticleTitle != null) 'nextArticleTitle': nextArticleTitle!.toMap(),
    if (nextArticleInfos != null) 'nextArticleInfos': nextArticleInfos!.toMap(),
    if (interviewQuestion != null)
      'interviewQuestion': interviewQuestion!.toMap(),
    if (interviewAnswer != null) 'interviewAnswer': interviewAnswer!.toMap(),
  };
}
