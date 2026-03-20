import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';

FlutterMilibrisPlatform get _platform => FlutterMilibrisPlatform.instance;

/// Returns the name of the current platform.
Future<String> getPlatformName() async {
  final platformName = await _platform.getPlatformName();
  if (platformName == null) throw Exception('Unable to get platform name.');
  return platformName;
}
