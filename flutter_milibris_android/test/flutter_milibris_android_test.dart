import 'package:flutter_milibris_android/flutter_milibris_android.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('FlutterMilibrisAndroid', () {
    test('can be registered', () {
      FlutterMilibrisAndroid.registerWith();
      expect(FlutterMilibrisPlatform.instance, isA<FlutterMilibrisAndroid>());
    });
  });
}
