import 'dart:convert';

import 'package:custom_audio_player/player_platform_interface.dart';

import 'models/player_configuration.dart';

class CustomAudioPlayer {
  factory CustomAudioPlayer() => _instance;

  CustomAudioPlayer._();

  static final CustomAudioPlayer _instance = CustomAudioPlayer._();

  Future<int?> play({required PlayerConfiguration playerConfig}) {
    final String jsonStringConfig = jsonEncode(playerConfig.toJson());
    return CustomAudioPlayerPlatform.instance.play(
      playerConfigJsonString: jsonStringConfig,
    );
  }


}
