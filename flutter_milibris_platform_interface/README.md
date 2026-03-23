# flutter_milibris_platform_interface

A common platform interface for the [`flutter_milibris`](../flutter_milibris) plugin.

## Overview

This package defines the `FlutterMilibrisPlatform` abstract class that all platform implementations must extend. It exposes two methods:

- `extractArchive(String tempPath, String destPath)` — extracts a Milibris archive to the destination path.
- `open(String destPath)` — opens the extracted content with the appropriate native reader.

## Implementing a new platform

Extend `FlutterMilibrisPlatform` and register your implementation:

```dart
class MyPlatformFlutterMilibris extends FlutterMilibrisPlatform {
  @override
  Future<void> extractArchive(String tempPath, String destPath) async {
    // platform-specific implementation
  }

  @override
  Future<void> open(String destPath) async {
    // platform-specific implementation
  }
}

// Register it
FlutterMilibrisPlatform.instance = MyPlatformFlutterMilibris();
```

> Use `extends` rather than `implements` to avoid breakage when new methods are added.
