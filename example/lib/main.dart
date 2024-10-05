import 'package:custom_audio_player/custom_audio_player.dart';
import 'package:custom_audio_player/models/player_configuration.dart';
import 'package:flutter/material.dart';

part 'mixin/main_mixin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with MainMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Audio Player"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ElevatedButton(
            onPressed: _play,
            child: const Text("play"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _stop,
            child: const Text("stop"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _getDuration,
            child: const Text("getDuration"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _getDeviceMusics,
            child: const Text("getDeviceMusics"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _getDeviceVolume,
            child: const Text("getDeviceVolume"),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _setDeviceVolume,
            child: const Text("setDeviceVolume"),
          ),
          const SizedBox(height: 16),
        ],
      ),
      //
    );
  }
}
