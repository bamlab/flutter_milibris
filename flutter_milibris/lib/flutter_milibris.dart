import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';

FlutterMilibrisPlatform get _platform => FlutterMilibrisPlatform.instance;

Future<void> extractArchive(String tempPath, String destPath) async {
  await _platform.extractArchive(tempPath, destPath);
}

Future<void> open(String destPath) async {
  await _platform.open(destPath);
}
