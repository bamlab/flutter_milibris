# flutter_milibris

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

## Customisation

The full list of configurable fields for each platform is documented in the native SDK references:

- [Android SDK config](https://github.com/miLibris/android-milibris-reader-sdk/blob/main/docs/config.md)
- [iOS SDK config](https://github.com/miLibris/ios-milibris-reader-sdk/blob/main/Docs/config.md)

Pass a `MilibrisUIConfig` as the second argument to `open` to customise the reader:

```dart
import 'package:flutter_milibris/flutter_milibris.dart';

await FlutterMilibris.open(
  '/path/to/output/directory',
  const MilibrisUIConfig(
    reader: ReaderUIConfig(
      isSummaryEnabled: true,
      isDoublePagesEnabled: true,
    ),
    navigationBar: NavigationBarUIConfig(
      progressBarFillColor: MilibrisColor(0xFF1A73E8),
    ),
  ),
);
```

All fields are optional — omit any section to keep the SDK's default.

### Config sections

`MilibrisUIConfig` is composed of the following optional sections:

| Field            | Class                    | Platforms    | Description                                      |
| ---------------- | ------------------------ | ------------ | ------------------------------------------------ |
| `reader`         | `ReaderUIConfig`         | Both         | Top-level feature flags, colors, and fonts       |
| `navigationBar`  | `NavigationBarUIConfig`  | Both         | Navigation bar colors, fonts, and brand logo     |
| `summary`        | `SummaryUIConfig`        | Both         | Full-screen article summary colors and fonts     |
| `articleReader`  | `ArticleReaderUIConfig`  | Both         | In-article reader colors, fonts, and text styles |
| `articleSettings`| `ArticleSettingsUIConfig`| Both         | Font / brightness settings panel                 |
| `readerTutorial` | `ReaderTutorialUIConfig` | Both         | Onboarding tutorial colors and fonts             |
| `slideshowBox`   | `SlideshowBoxUIConfig`   | Both         | Slideshow media box colors                       |
| `alert`          | `AlertUIConfig`          | Both         | Alert popin colors and fonts                     |
| `miniSummary`    | `MiniSummaryUIConfig`    | Android only | Mini-summary bottom sheet colors                 |
| `articleImage`   | `ArticleImageUIConfig`   | iOS only     | Full-screen image viewer colors                  |
| `htmlBox`        | `HtmlBoxUIConfig`        | iOS only     | HTML media box background color                  |
| `modal`          | `ModalUIConfig`          | iOS only     | Modal screens (e.g. search) navigation bar       |

### Colors

Colors are expressed as `MilibrisColor` using ARGB32 integers (`0xAARRGGBB`). Separate light and dark variants are supported:

```dart
// Same color in both modes
MilibrisColor(0xFF1A73E8)

// Different colors per mode
MilibrisColor(0xFF1A73E8, dark: 0xFF8AB4F8)
```

### Fonts (iOS only)

Fonts are set with `MilibrisFont`. Pass `null` for `name` to use the system font:

```dart
MilibrisFont(name: 'Georgia', size: 16, bold: false)
MilibrisFont(size: 14)  // system font at 14 pt
```

### Text styles (iOS only)

Text elements in `ArticleReaderUIConfig` accept a `MilibrisTextConfig` combining color, font, and line spacing:

```dart
ArticleReaderUIConfig(
  paragraph: MilibrisTextConfig(
    color: MilibrisColor(0xFF333333),
    font: MilibrisFont(name: 'Georgia', size: 16),
    lineSpacing: 1.4,
  ),
)
```

### Feature flags

Feature flags in `ReaderUIConfig` apply on both platforms at runtime:

| Field                      | Description                                   |
| -------------------------- | --------------------------------------------- |
| `isSummaryEnabled`         | Show / hide the summary button                |
| `isPrintEnabled`           | Show / hide the print button                  |
| `isDoublePagesEnabled`     | Enable double-page spread in landscape        |
| `longPressArticlesEnabled` | Long-press to open articles                   |
| `isFaceCropEnabled`        | On-device smart image crop                    |
| `isLandscapeOnly`          | Force landscape orientation (Android only)    |
| `showReaderTutorials`      | Show the first-launch tutorial (Android only) |
| `debugBoxes`               | Overlay article box boundaries                |

### Platform behaviour

**iOS** — colors and fonts passed in the config are applied at runtime by the SDK.

**Android** — feature flags are applied at runtime. Colors and fonts are **not** applied at runtime; they must be provided as XML resource overrides (see below).

### Android colors

On Android, colors are applied through XML resources that override the SDK's defaults. Generate them from your config using the generator script, or write them by hand following the resource names documented in the field-level comments of each config class.

#### Using the generator

The generator script lives at `example/tool/generate_android_colors.dart` in this repository. Copy it into your own project's `tool/` directory and adapt the two things it imports from the example app:

- the `MilibrisUIConfig` instance (replace the import of `milibris_example_config.dart` with your own config)
- the output paths (replace `example/android/...` with your app's actual `android/...` path)

Then run it from your project root:

```sh
dart run tool/generate_android_colors.dart
```

This writes two files:

```
android/app/src/main/res/values/milibris_colors.xml        # light mode
android/app/src/main/res/values-night/milibris_colors.xml  # dark mode
```

Commit both files and rebuild. Re-run the generator whenever the config changes.

---

## License

This project is licensed under the [MIT License](./LICENSE).

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
