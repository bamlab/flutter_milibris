import 'package:flutter_milibris/flutter_milibris.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterMilibrisPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements FlutterMilibrisPlatform {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group(FlutterMilibrisPlatform, () {
    late FlutterMilibrisPlatform flutterMilibrisPlatform;

    setUp(() {
      flutterMilibrisPlatform = MockFlutterMilibrisPlatform();
      FlutterMilibrisPlatform.instance = flutterMilibrisPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name when platform implementation exists',
          () async {
        const platformName = '__test_platform__';
        when(
          () => flutterMilibrisPlatform.getPlatformName(),
        ).thenAnswer((_) async => platformName);

        final actualPlatformName = await getPlatformName();
        expect(actualPlatformName, equals(platformName));
      });

      test('throws exception when platform implementation is missing',
          () async {
        when(
          () => flutterMilibrisPlatform.getPlatformName(),
        ).thenAnswer((_) async => null);

        expect(getPlatformName, throwsException);
      });
    });
  });
}
