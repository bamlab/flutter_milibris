import 'package:flutter/foundation.dart' show visibleForTesting;
import 'package:flutter/services.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';

/// An implementation of [FlutterMilibrisPlatform] that uses method channels.
class MethodChannelFlutterMilibris extends FlutterMilibrisPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_milibris');

  @override
  Future<String?> getPlatformName() {
    return methodChannel.invokeMethod<String>('getPlatformName');
  }
}
