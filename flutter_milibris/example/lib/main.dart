import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_milibris/flutter_milibris.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _status = 'Idle';
  bool _loading = false;
  String? _destPath;

  Future<void> _testExtraction() async {
    setState(() {
      _loading = true;
      _status = 'Extracting…';
      _destPath = null;
    });

    try {
      const fileName = '{fileName}.complete';
      final String archivePath;
      if (Platform.isAndroid) {
        final externalDir = await getExternalStorageDirectory();
        if (externalDir == null) {
          throw Exception('External storage unavailable');
        }
        archivePath = '${externalDir.path}/$fileName';
      } else if (Platform.isIOS) {
        final appFilesDir = await getApplicationSupportDirectory();
        archivePath = '${appFilesDir.path}/$fileName';
      } else {
        throw Exception('Unsupported platform');
      }

      final destDir = Directory('${Directory.systemTemp.path}/mili_out');
      if (destDir.existsSync()) destDir.deleteSync(recursive: true);
      destDir.createSync();

      await extractArchive(archivePath, destDir.path);

      final archiveSize = File(archivePath).lengthSync();
      final extractedSize = destDir
          .listSync(recursive: true)
          .whereType<File>()
          .fold(0, (s, f) => s + f.lengthSync());

      setState(() {
        _destPath = destDir.path;
        _status =
            'Extraction OK.\n'
            'Archive: ${_formatBytes(archiveSize)}\n'
            'Extracted: ${_formatBytes(extractedSize)}';
      });
    } on Exception catch (e) {
      setState(() => _status = 'Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _openReader() async {
    final dest = _destPath;
    if (dest == null) return;
    setState(() {
      _loading = true;
      _status = 'Opening reader…';
    });
    try {
      await open(dest);
      setState(() => _status = 'Reader opened.');
    } on Exception catch (e) {
      setState(() => _status = 'Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(2)} MB';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterMilibris Example')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _loading ? null : _testExtraction,
              child: _loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Test Extraction'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: (_loading || _destPath == null) ? null : _openReader,
              child: const Text('Open Reader'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Status:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SelectableText(_status),
          ],
        ),
      ),
    );
  }
}
