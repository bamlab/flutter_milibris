// ignore_for_file: avoid-referencing-subclasses, no-object-declaration

import 'package:flutter_milibris_platform_interface/src/default_flutter_milibris.dart';
import 'package:flutter_milibris_platform_interface/src/ui_config/milibris_ui_config.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

export 'package:flutter_milibris_platform_interface/src/ui_config/alert_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/article_image_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/article_reader_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/article_settings_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/html_box_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/milibris_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/mini_summary_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/modal_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/navigation_bar_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/reader_tutorial_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/reader_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/shared_types.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/slideshow_box_ui_config.dart';
export 'package:flutter_milibris_platform_interface/src/ui_config/summary_ui_config.dart';

/// {@template flutter_milibris_platform}
/// The interface that implementations of flutter_milibris must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `FlutterMilibris`.
///
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [FlutterMilibrisPlatform]
/// methods.
/// {@endtemplate}
abstract class FlutterMilibrisPlatform extends PlatformInterface {
  /// {@macro flutter_milibris_platform}
  FlutterMilibrisPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterMilibrisPlatform _instance = DefaultFlutterMilibris();

  /// The default instance of [FlutterMilibrisPlatform] to use.
  ///
  /// Defaults to [DefaultFlutterMilibris].
  static FlutterMilibrisPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [FlutterMilibrisPlatform] when they register
  /// themselves.
  static set instance(FlutterMilibrisPlatform value) {
    PlatformInterface.verify(value, _token);
    _instance = value;
  }

  /// Extracts a Milibris archive located at [tempPath] to [destPath].
  ///
  /// [tempPath] is the path to the `.complete` archive file.
  /// [destPath] is the directory where the archive contents will be extracted.
  Future<void> extractArchive(String tempPath, String destPath);

  /// Opens the extracted Milibris content at [destPath] in the native reader.
  ///
  /// [destPath] is the path to the directory produced by [extractArchive].
  /// [uiConfig] optionally customises the reader appearance and behaviour.
  Future<void> open(String destPath, [MilibrisUIConfig? uiConfig]);
}
