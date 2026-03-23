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

  group(FlutterMilibris, () {
    late MockFlutterMilibrisPlatform flutterMilibrisPlatform;

    setUp(() {
      flutterMilibrisPlatform = MockFlutterMilibrisPlatform();
      FlutterMilibrisPlatform.instance = flutterMilibrisPlatform;
    });

    group('extractArchive', () {
      test('delegates to platform', () async {
        when(
          () => flutterMilibrisPlatform.extractArchive(any(), any()),
        ).thenAnswer((_) async {});

        await FlutterMilibris.extractArchive('/tmp/archive.zip', '/tmp/dest');

        verify(
          () => flutterMilibrisPlatform.extractArchive(
            '/tmp/archive.zip',
            '/tmp/dest',
          ),
        ).called(1);
      });

      test('propagates platform exception', () async {
        when(
          () => flutterMilibrisPlatform.extractArchive(any(), any()),
        ).thenThrow(Exception('extraction failed'));

        expect(
          () => FlutterMilibris.extractArchive('/tmp/archive.zip', '/tmp/dest'),
          throwsException,
        );
      });
    });

    group('open', () {
      test('delegates to platform', () async {
        when(
          () => flutterMilibrisPlatform.open(any()),
        ).thenAnswer((_) async {});

        await FlutterMilibris.open('/tmp/dest');

        verify(
          () => flutterMilibrisPlatform.open('/tmp/dest'),
        ).called(1);
      });

      test('propagates platform exception', () async {
        when(
          () => flutterMilibrisPlatform.open(any()),
        ).thenThrow(Exception('open failed'));

        expect(() => FlutterMilibris.open('/tmp/dest'), throwsException);
      });
    });
  });
}
