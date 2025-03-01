# external_path

external_path is a flutter plugin that provides internal, external storage path and external public storage path.

https://pub.dev/packages/external_path

## Features

`ExternalPath.getExternalStoragePublicDirectory()` needs Public Directory Type argument
Below given table contains the types of argument you can pass to `getExternalStoragePublicDirectory()` function

| Directory                            | Android | iOS   |
| ------------------------------------ | :---: | :---:
| ExternalPath.DIRECTORY_MUSIC         |✔️      | ❌️    |
| ExternalPath.DIRECTORY_PODCASTS      |✔️      | ❌️    |
| ExternalPath.DIRECTORY_RINGTONES     |✔️     | ❌️    |
| ExternalPath.DIRECTORY_ALARMS        |✔️      | ❌️    |
| ExternalPath.DIRECTORY_NOTIFICATIONS |✔️      | ❌️    |
| ExternalPath.DIRECTORY_PICTURES      |✔️      | ❌️    |
| ExternalPath.DIRECTORY_MOVIES        |✔️      | ❌️    |
| ExternalPath.DIRECTORY_DOWNLOAD      |✔️      | ✔️    |
| ExternalPath.DIRECTORY_DCIM          |✔️      | ❌️    |
| ExternalPath.DIRECTORY_DOCUMENTS     |✔️      | ✔️    |
| ExternalPath.DIRECTORY_SCREENSHOTS   |✔️      | ❌️    |
| ExternalPath.DIRECTORY_AUDIOBOOKS    |✔️      | ❌️    |
| ExternalPath.DIRECTORY_CACHES    |❌️      | ✔️    |
| ExternalPath.DIRECTORY_LIBRARY    |❌️      | ✔️    |
| ExternalPath.DIRECTORY_APPLICATION_SUPPORT    |❌️      | ✔️    |


## Usage

First Add `external_path` as a dependency in your project `pubspec.yaml`.

Then, import `external_path` package.

```dart
import 'package:external_path/external_path.dart';
```

Package has two functions

```dart
  // Get storage directory paths
  Future<void> getPath_1() async {
    var path = await ExternalPath.getExternalStorageDirectories();
    print(path);  // [/storage/emulated/0, /storage/B3AE-4D28]

    // please note: B3AE-4D28 is external storage (SD card) folder name it can be any.
  }


  // To get public storage directory path
  Future<void> getPath_2() async {
    var path = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOAD);
    print(path);  // /storage/emulated/0/Download
  }
```
