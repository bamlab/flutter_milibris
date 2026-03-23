package com.milibris.flutter

import io.flutter.embedding.engine.plugins.FlutterPlugin

/**
 * Android Flutter plugin for flutter_milibris.
 *
 * This plugin exists to ensure the Milibris SDK dependencies are included
 * in the app's APK. All actual functionality is implemented in Dart via JNI.
 */
class FlutterMilibrisPlugin : FlutterPlugin {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {}
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {}
}
