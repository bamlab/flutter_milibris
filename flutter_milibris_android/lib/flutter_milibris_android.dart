// Uses JInstanceMethodId.call() to invoke Android framework methods
// (addFlags, startActivity) not covered by generated bindings.
// ignore_for_file: invalid_use_of_internal_member
import 'package:flutter_milibris_android/flutter_milibris_bindings.g.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:jni/jni.dart';

/// The Android implementation of [FlutterMilibrisPlatform].
class FlutterMilibrisAndroid extends FlutterMilibrisPlatform {
  /// Registers this class as the default instance of [FlutterMilibrisPlatform].
  static void registerWith() {
    FlutterMilibrisPlatform.instance = FlutterMilibrisAndroid();
  }

  // ---------------------------------------------------------------------------
  // Android framework calls not covered by generated bindings.
  // ---------------------------------------------------------------------------

  static final JClass _intentClass = JClass.forName('android/content/Intent');
  static final JClass _contextClass = JClass.forName('android/content/Context');

  static final JInstanceMethodId _idAddFlags = _intentClass.instanceMethodId(
    'addFlags',
    '(I)Landroid/content/Intent;',
  );
  static final JInstanceMethodId _idStartActivity = _contextClass
      .instanceMethodId(
        'startActivity',
        '(Landroid/content/Intent;)V',
      );

  // ---------------------------------------------------------------------------
  // Platform interface
  // ---------------------------------------------------------------------------

  @override
  Future<void> extractArchive(String archivePath, String destPath) async {
    final context = JObject.fromReference(Jni.getCachedApplicationContext());
    final foundationContext = Foundation.createContext(context);
    if (foundationContext == null) {
      throw Exception('Failed to create FoundationContext');
    }
    try {
      final archive = CompleteArchive.new$3(
        foundationContext,
        archivePath.toJString(),
      );
      try {
        archive.unpackTo$1(destPath.toJString());
      } finally {
        archive.release();
      }
    } finally {
      foundationContext.release();
      context.release();
    }
  }

  @override
  Future<void> open(String destPath) async {
    final context = JObject.fromReference(Jni.getCachedApplicationContext());

    final settings = ReaderSettings.new$2();

    final dataSource = XmlPdfReaderDataSource(settings)
      ..init(context, destPath.toJString());

    final intent = OneReaderActivity.newIntent(
      context,
      settings,
      dataSource, // implements ProductRepository
      null, // readerListener
      null, // pageAdRepository
      null, // searchProvider
      null, // sharedElementImageUrl
      null, // sharedElementRatio
    );

    // FLAG_ACTIVITY_NEW_TASK required when launching from application context.
    _idAddFlags.call(intent, JObject.type, [0x10000000]).release();
    _idStartActivity.call(context, const jvoidType(), [intent]);

    settings.release();
    dataSource.release();
    intent.release();
    context.release();
  }
}
