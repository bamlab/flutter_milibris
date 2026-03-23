# flutter_milibris_ios

The iOS implementation of [`flutter_milibris`](../flutter_milibris).

## Overview

This package is [endorsed](https://flutter.dev/docs/development/packages-and-plugins/developing-packages#endorsed-federated-plugin), so it is automatically included when you depend on `flutter_milibris`. You do not need to add it directly.

It uses [ffigen](https://pub.dev/packages/ffigen)-generated bindings and the `objective_c` package to call into the MiLibrisReaderSDK (distributed as an xcframework via Swift Package Manager):

- `extractArchive` — extracts a Milibris archive via `MLArchive.extract(_:inDirectory:error:)`.
- `open` — calls the native `milibris_open_reader` C function (defined in the Swift bridge) to launch the reader UI.
