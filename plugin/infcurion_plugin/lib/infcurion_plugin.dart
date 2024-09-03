
import 'infcurion_plugin_platform_interface.dart';

class InfcurionPlugin {
  Future<String?> getPlatformVersion() {
    return InfcurionPluginPlatform.instance.getPlatformVersion();
  }
}
