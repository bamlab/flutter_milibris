import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  _inlineRunFontTests();
  _brandFontFamilyTests();
}

void _inlineRunFontTests() {
  group('ArticleReaderUIConfig inline run fonts', () {
    test('omits inline run fonts when not set', () {
      final map = const ArticleReaderUIConfig().toMap();

      expect(map.containsKey('paragraphBoldFont'), isFalse);
      expect(map.containsKey('paragraphStrongFont'), isFalse);
      expect(map.containsKey('paragraphItalicFont'), isFalse);
      expect(map.containsKey('paragraphEmphasisFont'), isFalse);
    });

    test('serializes inline run fonts', () {
      const config = ArticleReaderUIConfig(
        paragraphBoldFont: MilibrisFont(name: 'Georgia-Bold', size: 18),
        paragraphStrongFont: MilibrisFont(name: 'Georgia-Bold', size: 18),
        paragraphItalicFont: MilibrisFont(name: 'Georgia-Italic', size: 18),
        paragraphEmphasisFont: MilibrisFont(name: 'Georgia-Italic', size: 18),
      );
      final map = config.toMap();

      expect(
        map['paragraphBoldFont'],
        equals({
          'name': 'Georgia-Bold',
          'size': 18.0,
          'bold': false,
          'italic': false,
        }),
      );
      expect(
        (map['paragraphStrongFont'] as Map)['name'],
        equals('Georgia-Bold'),
      );
      expect(
        (map['paragraphItalicFont'] as Map)['name'],
        equals('Georgia-Italic'),
      );
    });
  });
}

void _brandFontFamilyTests() {
  group('ArticleReaderUIConfig brand font families', () {
    test('omits families when not set', () {
      final map = const ArticleReaderUIConfig().toMap();

      expect(map.containsKey('primaryFont'), isFalse);
      expect(map.containsKey('secondaryFont'), isFalse);
      expect(map.containsKey('tertiaryFont'), isFalse);
    });

    test('serializes families and omits null weights', () {
      const config = ArticleReaderUIConfig(
        primaryFont: MilibrisPrimaryFont(
          regular: 'LibeSans-Regular',
          black: 'LibeSans-Black',
          bold: 'LibeSans-Bold',
        ),
        secondaryFont: MilibrisSecondaryFont(regular: 'Georgia'),
        tertiaryFont: MilibrisTertiaryFont(
          regular: 'Roboto-Regular',
          italic: 'Roboto-Italic',
        ),
      );
      final map = config.toMap();

      expect(
        map['primaryFont'],
        equals({
          'regular': 'LibeSans-Regular',
          'black': 'LibeSans-Black',
          'bold': 'LibeSans-Bold',
        }),
      );
      expect(map['secondaryFont'], equals({'regular': 'Georgia'}));
      expect(
        map['tertiaryFont'],
        equals({'regular': 'Roboto-Regular', 'italic': 'Roboto-Italic'}),
      );
    });
  });
}
