import 'package:flutter/services.dart';
import 'package:flutter_milibris_android/flutter_milibris_android.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterMilibrisAndroid', () {
    const kPlatformName = 'Android';
    late FlutterMilibrisAndroid flutterMilibris;
    late List<MethodCall> log;

    setUp(() async {
      flutterMilibris = FlutterMilibrisAndroid();

      log = <MethodCall>[];
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterMilibris.methodChannel, (methodCall) async {
        log.add(methodCall);
        switch (methodCall.method) {
          case 'getPlatformName':
            return kPlatformName;
          default:
            return null;
        }
      });
    });

    test('can be registered', () {
      FlutterMilibrisAndroid.registerWith();
      expect(FlutterMilibrisPlatform.instance, isA<FlutterMilibrisAndroid>());
    });

    test('getPlatformName returns correct name', () async {
      final name = await flutterMilibris.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(name, equals(kPlatformName));
    });
  });
}
