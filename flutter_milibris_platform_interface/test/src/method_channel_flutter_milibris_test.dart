import 'package:flutter/services.dart';
import 'package:flutter_milibris_platform_interface/src/method_channel_flutter_milibris.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const kPlatformName = 'platformName';

  group('$MethodChannelFlutterMilibris', () {
    late MethodChannelFlutterMilibris methodChannelFlutterMilibris;
    final log = <MethodCall>[];

    setUp(() async {
      methodChannelFlutterMilibris = MethodChannelFlutterMilibris();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
        methodChannelFlutterMilibris.methodChannel,
        (methodCall) async {
          log.add(methodCall);
          switch (methodCall.method) {
            case 'getPlatformName':
              return kPlatformName;
            default:
              return null;
          }
        },
      );
    });

    tearDown(log.clear);

    test('getPlatformName', () async {
      final platformName = await methodChannelFlutterMilibris.getPlatformName();
      expect(
        log,
        <Matcher>[isMethodCall('getPlatformName', arguments: null)],
      );
      expect(platformName, equals(kPlatformName));
    });
  });
}
