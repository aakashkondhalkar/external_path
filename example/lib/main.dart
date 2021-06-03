import 'package:flutter/material.dart';
import 'dart:async';
import 'package:external_path/external_path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> _exPath = [];

  @override
  void initState() {
    super.initState();

    getPath();

    getPublicDirectoryPath();
  }

  // Get storage directory paths
  // Like internal and external (SD card) storage path
  Future<void> getPath() async {
    List<String> paths;
    // getExternalStorageDirectories() will return list containing internal storage directory path
    // And external storage (SD card) directory path (if exists)
    paths = await ExternalPath.getExternalStorageDirectories();

    setState(() {
      _exPath = paths; // [/storage/emulated/0, /storage/B3AE-4D28]
    });
  }

  // To get public storage directory path like Downloads, Picture, Movie etc.
  // Use below code
  Future<void> getPublicDirectoryPath() async {
    String path;

    path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);

    setState(() {
      print(path); // /storage/emulated/0/Download
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: ListView.builder(
          itemCount: _exPath.length,
          itemBuilder: (context, index) {
            return Center(child: Text("${_exPath[index]}"));
          }),
    ));
  }
}
