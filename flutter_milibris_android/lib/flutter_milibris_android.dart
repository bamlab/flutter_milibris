// Uses JInstanceMethodId.call() to invoke Android framework methods
// (addFlags, startActivity, getResources, getPackageName, getIdentifier)
// not covered by generated bindings.
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
  static final JClass _resourcesClass = JClass.forName(
    'android/content/res/Resources',
  );
  static final JClass _integerClass = JClass.forName('java/lang/Integer');

  static final JInstanceMethodId _idAddFlags = _intentClass.instanceMethodId(
    'addFlags',
    '(I)Landroid/content/Intent;',
  );
  static final JInstanceMethodId _idStartActivity = _contextClass
      .instanceMethodId('startActivity', '(Landroid/content/Intent;)V');
  static final JInstanceMethodId _idGetResources = _contextClass
      .instanceMethodId('getResources', '()Landroid/content/res/Resources;');
  static final JInstanceMethodId _idGetPackageName = _contextClass
      .instanceMethodId('getPackageName', '()Ljava/lang/String;');
  static final JInstanceMethodId _idGetIdentifier = _resourcesClass
      .instanceMethodId(
        'getIdentifier',
        '(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I',
      );
  static final JStaticMethodId _idIntegerValueOf = _integerClass.staticMethodId(
    'valueOf',
    '(I)Ljava/lang/Integer;',
  );

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------

  /// Resolves a drawable resource name to its integer resource ID.
  static JInteger? _resolveDrawable(JObject context, String name) {
    final resources = _idGetResources.call(context, JObject.type, []);
    final packageName = _idGetPackageName.call(context, JString.type, []);
    final id = _idGetIdentifier.call(resources, const jintType(), [
      name.toJString(),
      'drawable'.toJString(),
      packageName,
    ]);
    resources.release();
    packageName.release();
    if (id == 0) return null;
    return _idIntegerValueOf.call(_integerClass, JInteger.type, [id]);
  }

  /// Applies [uiConfig] to [settings].
  static void _applyConfig(
    ReaderSettings settings,
    JObject context,
    MilibrisUIConfig uiConfig,
  ) {
    final reader = uiConfig.reader;
    if (reader != null) {
      if (reader.isSummaryEnabled != null) {
        settings.setSummaryEnabled(reader.isSummaryEnabled!);
      }
      if (reader.isPrintEnabled != null) {
        settings.setPrintEnabled(reader.isPrintEnabled!);
      }
      if (reader.isDoublePagesEnabled != null) {
        settings.setEnabledDoublePage(reader.isDoublePagesEnabled!);
      }
      if (reader.longPressArticlesEnabled != null) {
        settings.setShouldEnableLongPressOnArticles(
          reader.longPressArticlesEnabled!,
        );
      }
      if (reader.debugBoxes != null) {
        settings.setDebugBoxes(reader.debugBoxes!);
      }
      if (reader.isFaceCropEnabled != null) {
        settings.setFaceCropEnabled(reader.isFaceCropEnabled!);
      }
      if (reader.isLandscapeOnly != null) {
        settings.setLandscapeOnly(reader.isLandscapeOnly!);
      }
      if (reader.showReaderTutorials != null) {
        settings.setShowReaderTutorials(reader.showReaderTutorials!);
      }
    }

    final articleReader = uiConfig.articleReader;
    if (articleReader != null) {
      if (articleReader.isTextToSpeechEnabled != null) {
        settings.setTextToSpeechEnabled(articleReader.isTextToSpeechEnabled!);
      }
    }

    final navBar = uiConfig.navigationBar;
    if (navBar?.logoImageName != null) {
      final logoId = _resolveDrawable(context, navBar!.logoImageName!);
      if (logoId != null) {
        settings.setLogo(logoId);
        logoId.release();
      }
    }
  }

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
  Future<void> open(String destPath, [MilibrisUIConfig? uiConfig]) async {
    final context = JObject.fromReference(Jni.getCachedApplicationContext());

    final settings = ReaderSettings.new$2();

    if (uiConfig != null) _applyConfig(settings, context, uiConfig);

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
