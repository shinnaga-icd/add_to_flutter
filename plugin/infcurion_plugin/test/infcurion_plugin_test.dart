import 'package:flutter_test/flutter_test.dart';
import 'package:infcurion_plugin/infcurion_plugin.dart';
import 'package:infcurion_plugin/infcurion_plugin_platform_interface.dart';
import 'package:infcurion_plugin/infcurion_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockInfcurionPluginPlatform
    with MockPlatformInterfaceMixin
    implements InfcurionPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final InfcurionPluginPlatform initialPlatform = InfcurionPluginPlatform.instance;

  test('$MethodChannelInfcurionPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelInfcurionPlugin>());
  });

  test('getPlatformVersion', () async {
    InfcurionPlugin infcurionPlugin = InfcurionPlugin();
    MockInfcurionPluginPlatform fakePlatform = MockInfcurionPluginPlatform();
    InfcurionPluginPlatform.instance = fakePlatform;

    expect(await infcurionPlugin.getPlatformVersion(), '42');
  });
}
