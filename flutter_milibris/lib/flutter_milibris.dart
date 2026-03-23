import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';

/// Entry point for the Milibris Flutter plugin.
class FlutterMilibris {
  const FlutterMilibris._();

  static FlutterMilibrisPlatform get _platform =>
      FlutterMilibrisPlatform.instance;

  /// Extracts a Milibris archive to the given destination directory.
  ///
  /// [tempPath] is the path to the archive file to extract.
  /// [destPath] is the path to the directory where the archive will be
  /// extracted.
  ///
  /// Throws an [Exception] if the extraction fails.
  ///
  /// Example:
  /// ```dart
  /// await FlutterMilibris.extractArchive('/tmp/issue.mlbr', '/data/user/0/com.example/files');
  /// ```
  static Future<void> extractArchive(String tempPath, String destPath) async {
    await _platform.extractArchive(tempPath, destPath);
  }

  /// Opens the extracted Milibris content at [destPath] in the reader.
  ///
  /// [destPath] is the path to the directory containing the extracted archive,
  /// as returned by [extractArchive].
  ///
  /// Throws an [Exception] if the reader cannot be launched.
  ///
  /// Example:
  /// ```dart
  /// await FlutterMilibris.open('/data/user/0/com.example/files');
  /// ```
  static Future<void> open(String destPath) async {
    await _platform.open(destPath);
  }
}
