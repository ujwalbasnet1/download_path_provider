import 'package:flutter_test/flutter_test.dart';
import 'package:download_path_provider/download_path_provider.dart';
import 'package:download_path_provider/download_path_provider_platform_interface.dart';
import 'package:download_path_provider/download_path_provider_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDownloadPathProviderPlatform
    with MockPlatformInterfaceMixin
    implements DownloadPathProviderPlatform {
  @override
  Future<String?> getDownloadPath() => Future.value('42');
}

void main() {
  final DownloadPathProviderPlatform initialPlatform =
      DownloadPathProviderPlatform.instance;

  test('$MethodChannelDownloadPathProvider is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDownloadPathProvider>());
  });

  test('getDownloadPath', () async {
    DownloadPathProvider downloadPathProviderPlugin = DownloadPathProvider();
    MockDownloadPathProviderPlatform fakePlatform =
        MockDownloadPathProviderPlatform();
    DownloadPathProviderPlatform.instance = fakePlatform;

    expect(await downloadPathProviderPlugin.getDownloadPath(), '42');
  });
}
