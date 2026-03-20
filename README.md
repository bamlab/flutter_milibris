# Flutter Milibris SDK

A Flutter plugin that bridges the [Milibris](https://www.milibris.com/) native SDKs on iOS and Android, enabling you to extract Milibris `.complete` archives and launch the embedded reader directly from your Flutter application.

It is a Flutter monorepo containing a federated plugin split across several packages.

---

## Packages

| Package                                                                         | Description                                                          |
| ------------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| [`flutter_milibris`](./flutter_milibris/)                                       | Main front-facing plugin — the one you add to your app               |
| [`flutter_milibris_platform_interface`](./flutter_milibris_platform_interface/) | Abstract platform interface (contract shared by all implementations) |
| [`flutter_milibris_android`](./flutter_milibris_android/)                       | Android implementation (Kotlin + Milibris Android SDK)               |
| [`flutter_milibris_ios`](./flutter_milibris_ios/)                               | iOS implementation (Dart FFI + Milibris iOS SDK)                     |

---

## Platform support

| Android               | iOS     |
| --------------------- | ------- |
| API 19+ (Android 4.4) | iOS 13+ |

---

## Installation

Add the main package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_milibris:
```

---

## Usage

### Extract a `.complete` archive

Use `extractArchive` to unpack a Milibris `.complete` file to a destination directory:

```dart
import 'package:flutter_milibris/flutter_milibris.dart';

await extractArchive(
  '/path/to/archive.complete', // source archive
  '/path/to/output/directory', // destination
);
```

### Open the Milibris reader

After extraction, call `open` with the path to the extracted content to launch the native reader:

```dart
await open('/path/to/output/directory');
```

---

## Example app

A demo Flutter application is available in [`flutter_milibris/example`](./flutter_milibris/example/). It demonstrates:

- Locating a `.complete` file on the device
- Extracting the archive to a temp directory
- Opening the native Milibris reader with the extracted content

To run it:

```sh
cd flutter_milibris/example
flutter run
```

---

## Integration tests

Integration tests use [Fluttium](https://fluttium.dev/). Install the CLI first:

```sh
dart pub global activate fluttium_cli
```

Then run the tests from the example directory:

```sh
cd flutter_milibris/example
fluttium test flows/test_platform_name.yaml
```

---

## Updating the Milibris SDK (Android)

The Android implementation uses [jnigen](https://pub.dev/packages/jnigen) to generate Dart bindings from the Milibris AAR dependencies. The generated file [`flutter_milibris_android/lib/flutter_milibris_bindings.g.dart`](./flutter_milibris_android/lib/flutter_milibris_bindings.g.dart) is committed to the repository and only needs to be regenerated when the SDK version changes.

**1. Update the version** in [`flutter_milibris_android/android/build.gradle`](./flutter_milibris_android/android/build.gradle):

```groovy
def miLibrisReader = "x.y.z"
```

**2. Extract the classes JARs** from the new AARs. Temporarily add the following to `build.gradle`, run the task, then remove it:

```groovy
configurations { jnigenDeps }

dependencies {
    def miLibrisReader = "x.y.z"
    jnigenDeps("com.milibris:one-reader:${miLibrisReader}@aar") { transitive = false }
    jnigenDeps("com.milibris:milibris-reader:${miLibrisReader}@aar") { transitive = false }
    jnigenDeps("com.milibris:ml-foundation:<resolved-version>@aar") { transitive = false }
}

task extractJnigenDeps {
    def outputDir = file("${projectDir}/../.jnigen_deps")
    doLast {
        outputDir.mkdirs()
        file("${outputDir}/tasks").mkdirs()
        configurations.jnigenDeps.resolvedConfiguration.resolvedArtifacts.each { artifact ->
            def name = artifact.moduleVersion.id.module.name
            def tmp = file("${outputDir}/tmp_extract")
            tmp.mkdirs()
            project.copy { from project.zipTree(artifact.file); include "classes.jar"; into tmp }
            def dest = name == "one-reader" ? "one-reader-classes.jar"
                     : name == "milibris-reader" ? "tasks/classes.jar"
                     : "classes.jar"
            file("${tmp}/classes.jar").renameTo(file("${outputDir}/${dest}"))
            tmp.deleteDir()
        }
    }
}
```

Run it from `flutter_milibris/example/android/`:

```sh
./gradlew flutter_milibris_android:extractJnigenDeps
```

The JARs map as follows:

| `.jnigen_deps/` file | Source |
| -------------------- | ------ |
| `classes.jar` | `ml-foundation` |
| `tasks/classes.jar` | `milibris-reader` |
| `one-reader-classes.jar` | `one-reader` |

**3. Regenerate the bindings** from `flutter_milibris_android/`:

```sh
dart run jnigen --config jnigen.yaml
```

---

## License

This project is licensed under the [MIT License](./flutter_milibris/LICENSE).
