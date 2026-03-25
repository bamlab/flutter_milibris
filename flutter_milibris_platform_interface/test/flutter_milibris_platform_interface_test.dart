import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class _FlutterMilibrisMock extends FlutterMilibrisPlatform {
  String? lastExtractArchivePath;
  String? lastExtractDestPath;
  String? lastOpenPath;
  MilibrisUIConfig? lastOpenConfig;

  @override
  Future<void> extractArchive(String tempPath, String destPath) async {
    lastExtractArchivePath = tempPath;
    lastExtractDestPath = destPath;
  }

  @override
  Future<void> open(String destPath, [MilibrisUIConfig? uiConfig]) async {
    lastOpenPath = destPath;
    lastOpenConfig = uiConfig;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterMilibrisPlatformInterface', () {
    late _FlutterMilibrisMock flutterMilibrisPlatform;

    setUp(() {
      flutterMilibrisPlatform = _FlutterMilibrisMock();
      FlutterMilibrisPlatform.instance = flutterMilibrisPlatform;
    });

    group('extractArchive', () {
      test('calls implementation with correct arguments', () async {
        await FlutterMilibrisPlatform.instance.extractArchive(
          '/tmp/archive.zip',
          '/tmp/dest',
        );
        expect(
          flutterMilibrisPlatform.lastExtractArchivePath,
          equals('/tmp/archive.zip'),
        );
        expect(
          flutterMilibrisPlatform.lastExtractDestPath,
          equals('/tmp/dest'),
        );
      });
    });

    group('open', () {
      test('calls implementation with correct path', () async {
        await FlutterMilibrisPlatform.instance.open('/tmp/dest');
        expect(flutterMilibrisPlatform.lastOpenPath, equals('/tmp/dest'));
        expect(flutterMilibrisPlatform.lastOpenConfig, isNull);
      });

      test('passes uiConfig to implementation', () async {
        const config = MilibrisUIConfig(
          reader: ReaderUIConfig(isSummaryEnabled: false),
        );
        await FlutterMilibrisPlatform.instance.open('/tmp/dest', config);
        expect(flutterMilibrisPlatform.lastOpenPath, equals('/tmp/dest'));
        expect(flutterMilibrisPlatform.lastOpenConfig, equals(config));
      });
    });
  });
}
