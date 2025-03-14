import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:download_path_provider/download_path_provider_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDownloadPathProvider platform =
      MethodChannelDownloadPathProvider();
  const MethodChannel channel = MethodChannel('download_path_provider');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getDownloadPath', () async {
    expect(await platform.getDownloadPath(), '42');
  });
}
