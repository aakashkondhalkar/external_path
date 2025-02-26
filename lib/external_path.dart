import 'external_path_platform_interface.dart';

class ExternalPath {
  static const String DIRECTORY_MUSIC = "Music";
  static const String DIRECTORY_PODCASTS = "Podcasts";
  static const String DIRECTORY_RINGTONES = "Ringtones";
  static const String DIRECTORY_ALARMS = "Alarms";
  static const String DIRECTORY_NOTIFICATIONS = "Notifications";
  static const String DIRECTORY_PICTURES = "Pictures";
  static const String DIRECTORY_MOVIES = "Movies";
  static const String DIRECTORY_DOWNLOAD = "Download";
  static const String DIRECTORY_DCIM = "DCIM";
  static const String DIRECTORY_DOCUMENTS = "Documents";
  static const String DIRECTORY_SCREENSHOTS = "Screenshots";
  static const String DIRECTORY_AUDIOBOOKS = "Audiobooks";
  /// Only for iOS
  static const String DIRECTORY_LIBRARY = "Library";
  /// Only for iOS
  static const String DIRECTORY_CACHES = "Caches";
  /// Only for iOS
  static const String DIRECTORY_APPLICATION_SUPPORT =
      "ApplicationSupportDirectory";

  static Future<List<String>?> getExternalStorageDirectories() {
    return ExternalPathPlatform.instance.getExternalStorageDirectories();
  }

  static Future<String> getExternalStoragePublicDirectory(String type) {
    return ExternalPathPlatform.instance
        .getExternalStoragePublicDirectory(type);
  }
}
