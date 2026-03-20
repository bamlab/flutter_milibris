import Flutter

/// Flutter plugin for flutter_milibris_ios.
///
/// This class exists only for plugin registration. All functionality is
/// implemented in Dart via FFI (@_cdecl functions in MilibrisReaderBridge.swift).
public class FlutterMilibrisPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {}
}
