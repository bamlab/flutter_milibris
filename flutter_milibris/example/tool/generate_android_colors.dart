// Generates Android XML color resources from the example Milibris config.
//
// Run from the `example/` directory:
//
//   dart run tool/generate_android_colors.dart
//
// This writes two files:
//   android/app/src/main/res/values/milibris_colors.xml
//   android/app/src/main/res/values-night/milibris_colors.xml
//
// Commit both. Re-run whenever you change [milibrisUIConfig].
import 'dart:io';

import 'package:flutter_milibris/flutter_milibris_config.dart';

// ignore: avoid_relative_lib_imports
import '../lib/milibris_example_config.dart';

void main() {
  final root = _repoRoot();
  final xml = _toAndroidColorsXml(milibrisUIConfig);

  _write(
    '$root/android/app/src/main/res/values/milibris_colors.xml',
    xml.valuesXml,
  );
  _write(
    '$root/android/app/src/main/res/values-night/milibris_colors.xml',
    xml.valuesNightXml,
  );
}

// ignore: long-method
({String valuesXml, String valuesNightXml}) _toAndroidColorsXml(
  MilibrisUIConfig config,
) {
  final sections = <_Section>[];
  late Map<String, String> lightMap;
  late Map<String, String> nightMap;

  void beginSection(String label) {
    final s = _Section(label);
    sections.add(s);
    lightMap = s.light;
    nightMap = s.night;
  }

  // Adds two explicitly-named `_light`/`_dark` resources (both in values/).
  // The SDK reads both at all times; it picks the right one internally.
  void ld(String ln, String dn, MilibrisColor? c) {
    if (c == null) return;
    lightMap[ln] = _hex(c.light);
    lightMap[dn] = _hex(c.dark ?? c.light);
  }

  // Adds a single-named resource to values/ (light) and values-night/ (dark).
  void nm(String n, MilibrisColor? c) {
    if (c == null) return;
    lightMap[n] = _hex(c.light);
    nightMap[n] = _hex(c.dark ?? c.light);
  }

  // Adds a single-named resource with no dark variant.
  void single(String n, MilibrisColor? c) {
    if (c == null) return;
    lightMap[n] = _hex(c.light);
  }

  // ── Reader ─────────────────────────────────────────────────────────────────
  beginSection('Reader');
  final r = config.reader;
  if (r != null) {
    nm('or_background_color', r.backgroundColor);
    single('or_box_color', r.boxHighlightColor);
    nm('or_page_view_holder_color', r.pagePlaceholderColor);
    nm(
      'available_articles_indicator_start_bg_color',
      r.articleCapsuleHiddenBackgroundColor,
    );
    nm(
      'available_articles_indicator_start_text_color',
      r.articleCapsuleHiddenTextColor,
    );
    nm(
      'available_articles_indicator_end_bg_color',
      r.articleCapsuleBottomBackgroundColor,
    );
    nm(
      'available_articles_indicator_end_text_color',
      r.articleCapsuleBottomTextColor,
    );
    nm('or_flat_plan_holder_color', r.flatplanImagePlaceholderColor);
    nm('or_flat_plan_selected_color', r.flatplanSelectedBorderColor);
    nm('or_flat_plan_text_color', r.flatplanTitleTextColor);
    nm('or_flat_plan_line_color', r.bottomSheetDragIndicatorColor);
  }

  // ── Navigation bar ─────────────────────────────────────────────────────────
  beginSection('Navigation bar');
  final nb = config.navigationBar;
  if (nb != null) {
    ld(
      'or_toolbar_background_color_light',
      'or_toolbar_background_color_dark',
      nb.backgroundColor,
    );
    ld(
      'or_navigation_button_tint_light',
      'or_navigation_button_tint_dark',
      nb.buttonTint,
    );
    ld(
      'or_toolbar_title_text_light',
      'or_toolbar_title_text_dark',
      nb.titleColor,
    );
    ld(
      'or_toolbar_subtitle_text_light',
      'or_toolbar_subtitle_text_dark',
      nb.subtitleColor,
    );
    nm('or_progress_background_color', nb.progressBarBackgroundColor);
    nm('or_progress_color', nb.progressBarFillColor);
    ld(
      'or_logo_capsule_color_light',
      'or_logo_capsule_color_dark',
      nb.logoBackgroundColor,
    );
  }

  // ── Summary ────────────────────────────────────────────────────────────────
  beginSection('Summary');
  final s = config.summary;
  if (s != null) {
    ld(
      'or_rubric_selected_background_light',
      'or_rubric_selected_background_dark',
      s.rubricBackgroundColor,
    );
    ld('or_rubric_tint_light', 'or_rubric_tint_dark', s.rubricTextColor);
    ld(
      'or_summary_article_title_tint_light',
      'or_summary_article_title_tint_dark',
      s.cellTitleColor,
    );
    ld(
      'or_summary_article_subtitle_tint_light',
      'or_summary_article_subtitle_tint_dark',
      s.cellSubtitleColor,
    );
    single('or_summary_article_reading_time_tint_light', s.cellFooterColor);
    nm('or_holder_color', s.imagePlaceholderColor);
    nm('or_transparent_bg', s.overlayBackgroundColor);
  }

  // ── Article reader ─────────────────────────────────────────────────────────
  beginSection('Article reader');
  final ar = config.articleReader;
  if (ar != null) {
    ld(
      'or_articles_bottom_button_background_light',
      'or_articles_bottom_button_background_dark',
      ar.bottomBarBackgroundColor,
    );
    ld(
      'or_articles_bottom_button_tint_default_light',
      'or_articles_bottom_button_tint_default_dark',
      ar.bottomBarTint,
    );
    single('or_fish_eye_text_color', ar.fisheyeLabelTextColor);
    ld(
      'or_article_section_bg_light',
      'or_article_section_bg_dark',
      ar.sectionBackgroundColor,
    );
  }

  // ── Article settings (top-level then nested; nested takes precedence) ──────
  beginSection('Article settings');
  void applyArticleSettings(ArticleSettingsUIConfig? cfg) {
    if (cfg == null) return;
    nm('or_content_black_opacity_60', cfg.overlayBackgroundColor);
    ld(
      'or_articles_personalize_text_size_button_tint_light',
      'or_articles_personalize_text_size_button_tint_dark',
      cfg.fontSizeEnabledColor,
    );
    ld(
      'or_articles_personalize_line_spacing_button_tint_light',
      'or_articles_personalize_line_spacing_button_tint_dark',
      cfg.lineSpacingEnabledColor,
    );
    nm('or_display_mode_stroke_color', cfg.userInterfaceStyleBorderColor);
    nm('or_articles_bottom_button_tint_default', cfg.brightnessImagesColor);
    nm('or_articles_personalize_brightness_thumb', cfg.brightnessMinColor);
    nm(
      'or_articles_personalize_brightness_seekbar_background',
      cfg.brightnessMaxColor,
    );
    ld(
      'or_articles_bottom_button_tint_selected_light',
      'or_articles_bottom_button_tint_selected_dark',
      cfg.selectedTintColor,
    );
    ld(
      'or_articles_bottom_button_tint_disabled_light',
      'or_articles_bottom_button_tint_disabled_dark',
      cfg.disabledTintColor,
    );
  }

  applyArticleSettings(config.articleSettings);
  applyArticleSettings(config.articleReader?.articleSettings);

  // ── Alert (top-level then articleReader.alert; latter takes precedence) ────
  beginSection('Alert');
  void applyAlert(AlertUIConfig? cfg) {
    if (cfg == null) return;
    nm('or_popin_external_background', cfg.overlayBackgroundColor);
    nm('or_popin_background', cfg.contentBackgroundColor);
    nm('or_popin_title', cfg.titleTextColor);
    nm('or_popin_message', cfg.messageTextColor);
  }

  applyAlert(config.alert);
  applyAlert(config.articleReader?.alert);

  // ── Reader tutorial ────────────────────────────────────────────────────────
  beginSection('Reader tutorial');
  final rt = config.readerTutorial;
  if (rt != null) {
    nm('or_tutorial_bg', rt.overlayBackgroundColor ?? rt.imageBackgroundColor);
    nm('or_current_page_indicator', rt.currentPageIndicatorColor);
    nm('or_page_indicator', rt.pageIndicatorColor);
  }

  // ── Slideshow ──────────────────────────────────────────────────────────────
  beginSection('Slideshow');
  final ss = config.slideshowBox;
  if (ss != null) {
    nm('or_background_color', ss.backgroundColor);
    nm('or_image_caption_bg_color', ss.captionBackgroundColor);
    single('or_image_caption_text_color', ss.captionTextColor);
    nm('or_indicator_active_color', ss.currentPageIndicatorColor);
    nm('or_indicator_inactive_color', ss.pageIndicatorColor);
  }

  // ── Mini summary ───────────────────────────────────────────────────────────
  beginSection('Mini summary');
  final ms = config.miniSummary;
  if (ms != null) {
    nm('or_mini_summary_loading_tint', ms.loadingTintColor);
    nm('or_flat_plan_background_color', ms.backgroundColor);
    ld(
      'or_mini_summary_separator_light',
      'or_mini_summary_separator_dark',
      ms.separatorColor,
    );
  }

  return (
    valuesXml: _buildXml(sections, light: true),
    valuesNightXml: _buildXml(sections, light: false),
  );
}

String _buildXml(List<_Section> sections, {required bool light}) {
  final buffer = StringBuffer('<?xml version="1.0" encoding="utf-8"?>');
  var hasAny = false;

  for (final section in sections) {
    final map = light ? section.light : section.night;
    if (map.isEmpty) continue;
    if (!hasAny) {
      buffer.write('\n<resources>');
      hasAny = true;
    }
    buffer.write('\n\n    <!-- ${section.label} -->');
    for (final entry in map.entries) {
      buffer.write('\n    <color name="${entry.key}">${entry.value}</color>');
    }
  }

  if (!hasAny) {
    return '<?xml version="1.0" encoding="utf-8"?>\n'
        '<!-- Dark-mode color overrides are not needed here: all colors use\n'
        '     the _light/_dark suffix convention and are declared in\n'
        '     values/milibris_colors.xml. -->\n'
        '<resources/>';
  }
  buffer.write('\n</resources>');
  return buffer.toString();
}

/// Converts a Flutter ARGB int (0xAARRGGBB) to an Android hex color string.
/// Omits the alpha component when it is fully opaque (0xFF).
String _hex(int argb) {
  final a = (argb >> 24) & 0xFF;
  final r = (argb >> 16) & 0xFF;
  final g = (argb >> 8) & 0xFF;
  final b = argb & 0xFF;
  String h(int v) => v.toRadixString(16).padLeft(2, '0').toUpperCase();
  return a == 0xFF ? '#${h(r)}${h(g)}${h(b)}' : '#${h(a)}${h(r)}${h(g)}${h(b)}';
}

void _write(String path, String content) {
  File(path).writeAsStringSync(content);
  stdout.writeln('wrote $path');
}

String _repoRoot() {
  var dir = File(Platform.script.toFilePath()).parent;
  while (!File('${dir.path}/pubspec.yaml').existsSync()) {
    final parent = dir.parent;
    if (parent.path == dir.path) throw StateError('pubspec.yaml not found');
    dir = parent;
  }
  return dir.path;
}

class _Section {
  _Section(this.label);

  final String label;
  final Map<String, String> light = {};
  final Map<String, String> night = {};
}
