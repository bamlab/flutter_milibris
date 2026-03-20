// Uses internal JNI extensions to call Android framework methods
// (addFlags, startActivity) not covered by generated bindings.
// ignore_for_file: invalid_use_of_internal_member
import 'package:flutter_milibris_android/flutter_milibris_bindings.g.dart';
import 'package:flutter_milibris_platform_interface/flutter_milibris_platform_interface.dart';
import 'package:jni/_internal.dart' as jni_internal;
import 'package:jni/jni.dart';

/// The Android implementation of [FlutterMilibrisPlatform].
class FlutterMilibrisAndroid extends FlutterMilibrisPlatform {
  /// Registers this class as the default instance of [FlutterMilibrisPlatform].
  static void registerWith() {
    FlutterMilibrisPlatform.instance = FlutterMilibrisAndroid();
  }

  // ---------------------------------------------------------------------------
  // Raw JNI — Android framework calls not covered by generated bindings.
  // ---------------------------------------------------------------------------

  static final JClass _intentClass = JClass.forName('android/content/Intent');
  static final JClass _contextClass = JClass.forName('android/content/Context');

  static final JInstanceMethodId _idAddFlags = _intentClass.instanceMethodId(
    'addFlags',
    '(I)Landroid/content/Intent;',
  );
  static final JInstanceMethodId _idStartActivity =
      _contextClass.instanceMethodId(
        'startActivity',
        '(Landroid/content/Intent;)V',
      );

  // CallObjectMethod — int arg (e.g. addFlags)
  static final jni_internal.JniResult Function(
    jni_internal.Pointer<jni_internal.Void>,
    jni_internal.JMethodIDPtr,
    int,
  )
  _callObjectInt1 = jni_internal.ProtectedJniExtensions.lookup<
        jni_internal.NativeFunction<
          jni_internal.JniResult Function(
            jni_internal.Pointer<jni_internal.Void>,
            jni_internal.JMethodIDPtr,
            jni_internal.VarArgs<(jni_internal.Int32,)>,
          )
        >
      >('globalEnv_CallObjectMethod')
      .asFunction<
        jni_internal.JniResult Function(
          jni_internal.Pointer<jni_internal.Void>,
          jni_internal.JMethodIDPtr,
          int,
        )
      >();

  // CallVoidMethod — 1 pointer arg (e.g. startActivity)
  static final jni_internal.JThrowablePtr Function(
    jni_internal.Pointer<jni_internal.Void>,
    jni_internal.JMethodIDPtr,
    jni_internal.Pointer<jni_internal.Void>,
  )
  _callVoid1 = jni_internal.ProtectedJniExtensions.lookup<
        jni_internal.NativeFunction<
          jni_internal.JThrowablePtr Function(
            jni_internal.Pointer<jni_internal.Void>,
            jni_internal.JMethodIDPtr,
            jni_internal.VarArgs<
              (jni_internal.Pointer<jni_internal.Void>,)
            >,
          )
        >
      >('globalEnv_CallVoidMethod')
      .asFunction<
        jni_internal.JThrowablePtr Function(
          jni_internal.Pointer<jni_internal.Void>,
          jni_internal.JMethodIDPtr,
          jni_internal.Pointer<jni_internal.Void>,
        )
      >();

  // ---------------------------------------------------------------------------
  // Platform interface
  // ---------------------------------------------------------------------------

  @override
  Future<void> extractArchive(String archivePath, String destPath) async {
    final ctx = Jni.androidApplicationContext;
    final foundationContext = Foundation.createContext(ctx);
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
    }
  }

  @override
  Future<void> open(String destPath) async {
    final ctx = Jni.androidApplicationContext;

    final settings = ReaderSettings.new$2();

    final dataSource = XmlPdfReaderDataSource(settings, null)
      ..init(ctx, destPath.toJString());

    final intent = OneReaderActivity.newIntent(
      ctx,
      settings,
      dataSource, // implements ProductRepository
      null, // readerListener
      null, // pageAdRepository
      null, // searchProvider
      null, // logger
      null, // sharedElementImageUrl
      null, // sharedElementRatio
    );

    // FLAG_ACTIVITY_NEW_TASK required when launching from application context.
    _callObjectInt1(
      intent.reference.pointer,
      _idAddFlags as jni_internal.JMethodIDPtr,
      0x10000000,
    ).object(JObject.type).release();

    _callVoid1(
      ctx.reference.pointer,
      _idStartActivity as jni_internal.JMethodIDPtr,
      intent.reference.pointer,
    ).check();

    settings.release();
    dataSource.release();
    intent.release();
  }
}
