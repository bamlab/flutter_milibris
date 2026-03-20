import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';

/// The Android implementation of [FlutterMilibrisPlatform].
class FlutterMilibrisAndroid extends FlutterMilibrisPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_milibris_android');

  /// Registers this class as the default instance of [FlutterMilibrisPlatform]
  static void registerWith() {
    FlutterMilibrisPlatform.instance = FlutterMilibrisAndroid();
  }

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
