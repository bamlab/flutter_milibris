# flutter_milibris_android

The Android implementation of [`flutter_milibris`](../flutter_milibris).

## Overview

This package is [endorsed](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#endorsed-federated-plugin), so it is automatically included when you depend on `flutter_milibris`. You do not need to add it directly.

It uses [jnigen](https://pub.dev/packages/jnigen)-generated bindings to call into the Milibris Android SDK:

- `extractArchive` — unpacks a Milibris archive via `CompleteArchive.unpackTo()` using a `FoundationContext`.
- `open` — launches `OneReaderActivity` with an `XmlPdfReaderDataSource` and `ReaderSettings`.
