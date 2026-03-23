# Flutter Milibris SDK

A Flutter federated plugin that bridges the [Milibris](https://www.milibris.com/) native SDKs on iOS and Android, enabling you to extract Milibris `.complete` archives and launch the embedded reader directly from your Flutter application.

---

## Packages

This monorepo contains the following packages, each with its own README:

| Package                                                                         | Description                                                     |
| ------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| [`flutter_milibris`](./flutter_milibris/)                                       | Main front-facing plugin — the one you add to your app          |
| [`flutter_milibris_platform_interface`](./flutter_milibris_platform_interface/) | Abstract platform interface shared by all implementations       |
| [`flutter_milibris_android`](./flutter_milibris_android/)                       | Android implementation (Kotlin + jnigen + Milibris Android SDK) |
| [`flutter_milibris_ios`](./flutter_milibris_ios/)                               | iOS implementation (Dart FFI + Milibris iOS SDK)                |

For setup instructions, usage, and platform-specific details, see the [`flutter_milibris` README](./flutter_milibris/README.md).

---

## Platform support

| Android               | iOS     |
| --------------------- | ------- |
| API 19+ (Android 4.4) | iOS 13+ |

---

## Development

### Getting started

Install [melos](https://melos.invertase.dev/) and bootstrap the monorepo:

```sh
dart pub get        # installs melos
melos bs            # pub get + local package linking across all packages
```

### Available scripts

| Command                  | Description                              |
| ------------------------ | ---------------------------------------- |
| `melos analyze`          | Run `flutter analyze` on all packages    |
| `melos test`             | Run `flutter test` on all packages       |
| `melos generate:android` | Regenerate Android JNI bindings (jnigen) |
| `melos generate:ios`     | Regenerate iOS FFI bindings (ffigen)     |
| `melos publish`          | Publish all packages in dependency order |

---

## License

This project is licensed under the [MIT License](./flutter_milibris/LICENSE).
