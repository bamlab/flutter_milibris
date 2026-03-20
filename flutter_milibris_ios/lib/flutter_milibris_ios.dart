import 'dart:ffi' as ffi;

import 'package:ffi/ffi.dart';
import 'package:flutter_milibris_ios/flutter_milibris_bindings.g.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:objective_c/objective_c.dart' as objc;

final void Function(ffi.Pointer<Utf8>) _openReader =
    ffi.DynamicLibrary.process().lookupFunction<
      ffi.Void Function(ffi.Pointer<Utf8>),
      void Function(ffi.Pointer<Utf8>)
    >('milibris_open_reader');

/// The iOS implementation of [FlutterMilibrisPlatform].
class FlutterMilibrisIOS extends FlutterMilibrisPlatform {
  /// Registers this class as the default instance of [FlutterMilibrisPlatform].
  static void registerWith() {
    FlutterMilibrisPlatform.instance = FlutterMilibrisIOS();
  }

  @override
  Future<void> extractArchive(String archivePath, String destPath) async {
    final archiveUrl = objc.NSURL.fileURLWithPath(objc.NSString(archivePath));
    final destUrl = objc.NSURL.fileURLWithPath(objc.NSString(destPath));
    final errorPtr = calloc<ffi.Pointer<objc.ObjCObjectImpl>>();
    try {
      final success = MLArchive.extract(
        archiveUrl,
        inDirectory: destUrl,
        error: errorPtr,
      );
      if (!success) {
        var message = 'Extraction failed.';
        if (errorPtr.value.address != 0) {
          final nsError = objc.NSError.fromPointer(
            errorPtr.value,
            retain: true,
            release: true,
          );
          message = nsError.localizedDescription.toDartString();
        }
        throw Exception(message);
      }
    } finally {
      calloc.free(errorPtr);
    }
  }

  @override
  Future<void> open(String destPath) async {
    final pathPtr = destPath.toNativeUtf8();
    try {
      _openReader(pathPtr);
    } finally {
      malloc.free(pathPtr);
    }
  }
}
