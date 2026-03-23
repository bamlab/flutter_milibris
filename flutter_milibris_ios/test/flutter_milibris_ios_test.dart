import 'package:flutter_milibris_ios/flutter_milibris_ios.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterMilibrisIOS', () {
    test('can be registered', () {
      FlutterMilibrisIOS.registerWith();
      expect(FlutterMilibrisPlatform.instance, isA<FlutterMilibrisIOS>());
    });
  });
}
