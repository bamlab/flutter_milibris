import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MilibrisUIConfig articlesLanguageCode', () {
    test('omits the articles language code when not set', () {
      final map = const MilibrisUIConfig().toMap();

      expect(map.containsKey('articlesLanguageCode'), isFalse);
    });

    test('serializes the articles language code', () {
      final map = const MilibrisUIConfig(articlesLanguageCode: 'fr-FR').toMap();

      expect(map['articlesLanguageCode'], equals('fr-FR'));
    });
  });
}
