import 'dart:async';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _exPath = [];
  List<String> _directories = [];

  @override
  void initState() {
    super.initState();

    getPath();

    getPublicDirectoryPath();
  }

  // Get storage directory paths
  // Like internal and external (SD card) storage path
  Future<void> getPath() async {
    List<String>? paths;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    paths = await ExternalPath.getExternalStorageDirectories();

    setState(() {
      _exPath = paths!; // [/storage/emulated/0, /storage/B3AE-4D28]
    });
  }

  // To get public storage directory path like Downloads, Picture, Movie etc.
  // Use below code
  Future<void> getPublicDirectoryPath() async {
    var path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOCUMENTS);
    var path1 = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_CACHES);
    var path2 = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    var path3 = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_LIBRARY);
    var path4 = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_APPLICATION_SUPPORT);
    var path5 = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_ALARMS);
    // var paths = await ExternalPath.getExternalStorageDirectories();
    _directories.addAll([path, path1, path2, path3, path4, path5]);
    // final directory = await getApplicationSupportDirectory();
    print('DOCUMENTS: ${path}'); // Print to debug
    print('CACHES: ${path1}'); // Print to debug
    print('DOWNLOADS: ${path2}'); // Print to debug
    print('LIBRARY: ${path3}'); // Print to debug
    print('APPLICATION_SUPPORT: ${path4}'); // Print to debug

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._exPath.map((e) => Text("$e")).toList(),
            const SizedBox(height: 8),
            ..._directories.map((e) => Text("$e")).toList(),
          ],
        ),
      ),
    );
  }
}
