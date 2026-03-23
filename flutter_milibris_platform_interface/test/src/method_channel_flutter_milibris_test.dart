import 'package:flutter_milibris_platform_interface/src/default_flutter_milibris.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('$DefaultFlutterMilibris', () {
    late DefaultFlutterMilibris defaultFlutterMilibris;

    setUp(() {
      defaultFlutterMilibris = DefaultFlutterMilibris();
    });

    test('extractArchive throws UnimplementedError', () {
      expect(
        () => defaultFlutterMilibris.extractArchive(
          '/tmp/archive.zip',
          '/tmp/dest',
        ),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('open throws UnimplementedError', () {
      expect(
        () => defaultFlutterMilibris.open('/tmp/dest'),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
