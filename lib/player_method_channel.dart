import 'dart:async';


import 'package:custom_audio_player/player_platform_interface.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MethodChannelCustomAudioVideoPlayer extends CustomAudioPlayerPlatform {

  final methodChannel = const MethodChannel('custom_audio_player');

  @override
  Future<int?> play({
    required String playerConfigJsonString,
  }) async {
    final res = await methodChannel.invokeMethod<int?>(
      'play',
      <String, dynamic>{'playerConfigJsonString': playerConfigJsonString},
    );
    return res;
  }

  @override
  void dispose() {}
}
