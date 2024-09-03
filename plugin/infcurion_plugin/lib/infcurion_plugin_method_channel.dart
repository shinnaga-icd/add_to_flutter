import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'infcurion_plugin_platform_interface.dart';

/// An implementation of [InfcurionPluginPlatform] that uses method channels.
class MethodChannelInfcurionPlugin extends InfcurionPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('infcurion_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
