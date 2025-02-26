import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'external_path_platform_interface.dart';

/// An implementation of [ExternalPathPlatform] that uses method channels.
class MethodChannelExternalPath extends ExternalPathPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('external_path');

  @override
  Future<List<String>?> getExternalStorageDirectories() async {
    final List externalStorageDirs =
        await methodChannel.invokeMethod('getExternalStorageDirectories');

    List<String> storageInfos = externalStorageDirs
        .map((storageInfoMap) => _ExStoragePath.getRootDir(storageInfoMap))
        .toList();
    return storageInfos;
  }

  @override
  Future<String> getExternalStoragePublicDirectory(String type) async {
    final String externalPublicDir = await methodChannel
        .invokeMethod('getExternalStoragePublicDirectory', {'type': type});
    return externalPublicDir;
  }
}

class _ExStoragePath {
  static String getRootDir(String appFilesDir) {
    return appFilesDir
        .split("/")
        .sublist(0, appFilesDir.split("/").length - 4)
        .join("/");
  }
}
