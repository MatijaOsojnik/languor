import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';

class AudioWidget extends StatefulWidget {
  final Sound sound;
  const AudioWidget({this.sound});
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<AudioWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration duration = const Duration();
  Duration position = const Duration();

  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            key: const ValueKey("goBack"),
            icon: const Icon(Icons.cancel_sharp),
            iconSize: 30.0,
            onPressed: () async {
              await audioPlayer.release();
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            slider(),
            InkWell(
              onTap: () => getAudio(),
              child: Icon(
                  playing == false
                      ? Icons.play_circle_outline
                      : Icons.pause_circle_outline,
                  size: 50,
                  color: Colors.blueGrey),
            )
          ],
        ),
      ),
    ));
  }

  Widget slider() {
    return Slider.adaptive(
        value: position.inSeconds.toDouble(),
        min: 0.0,
        max: duration.inSeconds.toDouble() > 0
            ? duration.inSeconds.toDouble()
            : 60.0,
        onChanged: (double value) => {
              setState(
                  () => {audioPlayer.seek(Duration(seconds: value.toInt()))})
            });
  }

  // ignore: type_annotate_public_apis
  // ignore: always_declare_return_types
  // ignore: type_annotate_public_apis
  Future getAudio() async {
    // const url =
    //     'https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3';
    //playing is false by default
    await audioPlayer.setUrl(
        'https://assets.mixkit.co/music/preview/mixkit-a-very-happy-christmas-897.mp3');
    await audioPlayer.setReleaseMode(ReleaseMode.STOP);
    if (playing) {
      //pause audio
      final res = await audioPlayer.pause();
      if (res == 1) {
        setState(() => {playing = false});
      }
    } else {
      //play audio
      final res = await audioPlayer.resume();
      if (res == 1) {
        setState(() => {playing = true});
      }
    }
    audioPlayer.onDurationChanged
        .listen((Duration d) => {setState(() => duration = d)});

    audioPlayer.onAudioPositionChanged
        .listen((Duration d) => {setState(() => position = d)});

    audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
    });
  }
}
