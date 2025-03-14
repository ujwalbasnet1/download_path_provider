import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'download_path_provider_platform_interface.dart';

/// An implementation of [DownloadPathProviderPlatform] that uses method channels.
class MethodChannelDownloadPathProvider extends DownloadPathProviderPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('download_path_provider');

  @override
  Future<String?> getDownloadPath() async {
    final version = await methodChannel.invokeMethod<String>('getDownloadPath');
    return version;
  }
}
