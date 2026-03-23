# flutter_milibris

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

A Flutter plugin that bridges the [Milibris](https://www.milibris.com/) native SDKs on iOS and Android, enabling you to extract Milibris `.complete` archives and launch the embedded reader directly from your Flutter application.

---

## Platform support

| Android               | iOS     |
| --------------------- | ------- |
| API 19+ (Android 4.4) | iOS 13+ |

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies: flutter_milibris
```

---

## Setup

### Android

#### 1. Add the Milibris Maven repository

In `android/build.gradle.kts`, add the Milibris Maven repository inside `allprojects > repositories`:

```kotlin
allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://maven-android-sdk.milibris.net/") }
    }
}
```

#### 2. Enable core library desugaring

In `android/app/build.gradle.kts`, enable desugaring and add the dependency:

```kotlin
android {
    compileOptions {
        isCoreLibraryDesugaringEnabled = true
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
}
```

#### 3. Add the licence key

In `android/app/src/main/AndroidManifest.xml`, add the licence key inside `<application>`:

```xml
<meta-data
    android:name="com.milibris.pdfreader.licencekey"
    android:value="YOUR_LICENCE_KEY" />
```

Also add `xmlns:tools` to the manifest root and `tools:replace="android:label"` to `<application>` to avoid merge conflicts with the plugin's manifest:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          xmlns:tools="http://schemas.android.com/tools">
    <application
        ...
        tools:replace="android:label">
```

#### 4. Add `xmlns:tools` to the plugin manifest

In `flutter_milibris_android/android/src/main/AndroidManifest.xml`, add the tools namespace so the manifest merger accepts `tools:replace` from the app:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          xmlns:tools="http://schemas.android.com/tools"/>
```

---

### iOS

#### 1. Add the licence key

In `ios/Runner/Info.plist`, add:

```xml
<key>MiLibrisReaderSDKLicenceKey</key>
<string>YOUR_LICENCE_KEY</string>
```

#### 2. Install CocoaPods dependencies

```sh
cd ios && pod install && cd ..
```

---

## Usage

### Extract a `.complete` archive

Use `extractArchive` to unpack a Milibris `.complete` file to a destination directory:

```dart
import 'package:flutter_milibris/flutter_milibris.dart';

await FlutterMilibris.extractArchive(
  '/path/to/archive.complete', // source archive
  '/path/to/output/directory', // destination
);
```

### Open the Milibris reader

After extraction, call `open` with the path to the extracted content to launch the native reader:

```dart
await FlutterMilibris.open('/path/to/output/directory');
```

---

## License

This project is licensed under the [MIT License](./LICENSE).

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
