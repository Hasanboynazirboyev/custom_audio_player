part of '../main.dart';

mixin MainMixin on State<MyHomePage> {
  late CustomAudioPlayer _customAudioPlayer;

  @override
  void initState() {
    _customAudioPlayer = CustomAudioPlayer();
    super.initState();
  }

  Future<void> _play() async {
    _customAudioPlayer.play(playerConfig: const PlayerConfiguration(url: ""));
  }

  Future<void> _stop() async {}

  Future<void> _getDuration() async {}

  Future<void> _getDeviceMusics() async {}

  Future<void> _getDeviceVolume() async {}

  Future<void> _setDeviceVolume() async {}

  @override
  void dispose() {
    super.dispose();
  }
}
