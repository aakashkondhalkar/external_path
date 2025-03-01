import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'external_path_method_channel.dart';

abstract class ExternalPathPlatform extends PlatformInterface {
  /// Constructs a ExternalPathPlatform.
  ExternalPathPlatform() : super(token: _token);

  static final Object _token = Object();

  static ExternalPathPlatform _instance = MethodChannelExternalPath();

  /// The default instance of [ExternalPathPlatform] to use.
  ///
  /// Defaults to [MethodChannelExternalPath].
  static ExternalPathPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ExternalPathPlatform] when
  /// they register themselves.
  static set instance(ExternalPathPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<List<String>?> getExternalStorageDirectories() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String> getExternalStoragePublicDirectory(String type) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
