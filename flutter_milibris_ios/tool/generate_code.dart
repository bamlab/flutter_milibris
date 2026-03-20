import 'dart:io';

import 'package:ffigen/ffigen.dart';

void main() {
  // Find MLArchive.h — check the local SPM build cache first, then DerivedData.
  final header = _findLocalHeader() ?? _findDerivedDataHeader();
  if (header == null) {
    throw StateError(
      'MLArchive.h not found.\n'
      'Run `swift package resolve` in ios/flutter_milibris_ios/, or open the '
      'example app in Xcode and build once to populate DerivedData.',
    );
  }

  FfiGenerator(
    output: Output(
      dartFile: Uri.parse('lib/flutter_milibris_bindings.g.dart'),
    ),
    headers: Headers(
      entryPoints: [Uri.file(header)],
      include: (uri) => uri.path.endsWith('MLArchive.h'),
    ),
    objectiveC: ObjectiveC(
      interfaces: Interfaces.includeSet({'MLArchive'}),
    ),
  ).generate();
}

/// Checks the local SPM build cache (populated by `swift package resolve`).
String? _findLocalHeader() {
  const path = 'ios/.build/artifacts'
      '/ios-milibris-reader-sdk/MiLibrisReaderSDK'
      '/MiLibrisReaderSDK.xcframework'
      '/ios-arm64/MiLibrisReaderSDK.framework/Headers/MLArchive.h';
  return File(path).existsSync() ? path : null;
}

/// Falls back to searching Xcode DerivedData.
String? _findDerivedDataHeader() {
  final home = Platform.environment['HOME']!;
  final result = Process.runSync('find', [
    '$home/Library/Developer/Xcode/DerivedData',
    '-name',
    'MLArchive.h',
    '-path',
    '*/ios-arm64/MiLibrisReaderSDK.framework/Headers/*',
  ]);
  final path = result.stdout.toString().trim().split('\n').firstOrNull;
  return (path != null && path.isNotEmpty) ? path : null;
}
