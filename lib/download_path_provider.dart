import 'download_path_provider_platform_interface.dart';

class DownloadPathProvider {
  Future<String?> getDownloadPath() {
    return DownloadPathProviderPlatform.instance.getDownloadPath();
  }
}
