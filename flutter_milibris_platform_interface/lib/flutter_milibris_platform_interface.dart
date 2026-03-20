import 'package:flutter_milibris_platform_interface/src/default_flutter_milibris.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// {@template flutter_milibris_platform}
/// The interface that implementations of flutter_milibris must implement.
///
/// Platform implementations should extend this class
/// rather than implement it as `FlutterMilibris`.
///
/// Extending this class (using `extends`) ensures that the subclass will get
/// the default implementation, while platform implementations that `implements`
/// this interface will be broken by newly added [FlutterMilibrisPlatform] methods.
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
  /// class that extends [FlutterMilibrisPlatform] when they register themselves.
  static set instance(FlutterMilibrisPlatform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Extract the archive and return the path to the extracted files.
  Future<void> extractArchive(String tempPath, String destPath);

  /// Open the extracted files with the appropriate application.
  Future<void> open(String destPath);
}
