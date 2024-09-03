import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'infcurion_plugin_method_channel.dart';

abstract class InfcurionPluginPlatform extends PlatformInterface {
  /// Constructs a InfcurionPluginPlatform.
  InfcurionPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static InfcurionPluginPlatform _instance = MethodChannelInfcurionPlugin();

  /// The default instance of [InfcurionPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelInfcurionPlugin].
  static InfcurionPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [InfcurionPluginPlatform] when
  /// they register themselves.
  static set instance(InfcurionPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
