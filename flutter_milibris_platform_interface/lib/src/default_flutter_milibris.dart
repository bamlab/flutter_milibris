// coverage:ignore-file
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';

/// An implementation of [FlutterMilibrisPlatform]
/// that throws [UnimplementedError] when used.
/// Used by default if no other implementation is registered.
class DefaultFlutterMilibris extends FlutterMilibrisPlatform {
  @override
  Future<void> extractArchive(String tempPath, String destPath) {
    throw UnimplementedError('extractArchive() has not been implemented.');
  }

  @override
  Future<void> open(String destPath) {
    throw UnimplementedError('open() has not been implemented.');
  }
}
