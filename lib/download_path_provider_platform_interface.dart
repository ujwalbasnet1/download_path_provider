import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'download_path_provider_method_channel.dart';

abstract class DownloadPathProviderPlatform extends PlatformInterface {
  /// Constructs a DownloadPathProviderPlatform.
  DownloadPathProviderPlatform() : super(token: _token);

  static final Object _token = Object();

  static DownloadPathProviderPlatform _instance =
      MethodChannelDownloadPathProvider();

  /// The default instance of [DownloadPathProviderPlatform] to use.
  ///
  /// Defaults to [MethodChannelDownloadPathProvider].
  static DownloadPathProviderPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DownloadPathProviderPlatform] when
  /// they register themselves.
  static set instance(DownloadPathProviderPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getDownloadPath() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
