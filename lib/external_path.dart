import 'dart:async';
import 'package:flutter/services.dart';

class ExternalPath {
  static const MethodChannel _channel = const MethodChannel('external_path');

  static final String DIRECTORY_MUSIC = "Music";
  static final String DIRECTORY_PODCASTS = "Podcasts";
  static final String DIRECTORY_RINGTONES = "Ringtones";
  static final String DIRECTORY_ALARMS = "Alarms";
  static final String DIRECTORY_NOTIFICATIONS = "Notifications";
  static final String DIRECTORY_PICTURES = "Pictures";
  static final String DIRECTORY_MOVIES = "Movies";
  static final String DIRECTORY_DOWNLOADS = "Download";
  static final String DIRECTORY_DCIM = "DCIM";
  static final String DIRECTORY_DOCUMENTS = "Documents";
  static final String DIRECTORY_SCREENSHOTS = "Screenshots";
  static final String DIRECTORY_AUDIOBOOKS = "Audiobooks";

  static Future<List<String>> getExternalStorageDirectories() async {
    final List externalStorageDirs =
        await _channel.invokeMethod('getExternalStorageDirectories');

    List<String> storageInfos = externalStorageDirs
        .map((storageInfoMap) => ExStoragePath01.getRootDir(storageInfoMap))
        .toList();
    return storageInfos;
  }

  static Future<String> getExternalStoragePublicDirectory(String type) async {
    final String externalPublicDir = await _channel
        .invokeMethod('getExternalStoragePublicDirectory', {'type': type});
    return externalPublicDir;
  }
}

class ExStoragePath01 {
  static String getRootDir(String appFilesDir) {
    return appFilesDir
        .split("/")
        .sublist(0, appFilesDir.split("/").length - 4)
        .join("/");
  }
}
