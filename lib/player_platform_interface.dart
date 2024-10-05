import 'package:custom_audio_player/player_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class CustomAudioPlayerPlatform extends PlatformInterface {
  CustomAudioPlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static CustomAudioPlayerPlatform _instance = MethodChannelCustomAudioVideoPlayer();

  static CustomAudioPlayerPlatform get instance => _instance;

  static set instance(CustomAudioPlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<int?> play({required String playerConfigJsonString}) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  void dispose() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
