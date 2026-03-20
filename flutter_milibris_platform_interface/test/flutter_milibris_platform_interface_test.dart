import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

class FlutterMilibrisMock extends FlutterMilibrisPlatform {
  static const mockPlatformName = 'Mock';

  @override
  Future<String?> getPlatformName() async => mockPlatformName;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('FlutterMilibrisPlatformInterface', () {
    late FlutterMilibrisPlatform flutterMilibrisPlatform;

    setUp(() {
      flutterMilibrisPlatform = FlutterMilibrisMock();
      FlutterMilibrisPlatform.instance = flutterMilibrisPlatform;
    });

    group('getPlatformName', () {
      test('returns correct name', () async {
        expect(
          await FlutterMilibrisPlatform.instance.getPlatformName(),
          equals(FlutterMilibrisMock.mockPlatformName),
        );
      });
    });
  });
}
