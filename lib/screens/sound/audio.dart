import 'dart:async';

import 'package:Languor/models/sound.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:firebase_image/firebase_image.dart';

class AudioWidget extends StatefulWidget {
  final Sound sound;
  const AudioWidget({this.sound});
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<AudioWidget> {
  final AudioPlayer audioPlayer = AudioPlayer();
  final AudioCache audioCache = AudioCache();
  Duration duration = const Duration();
  Duration position = const Duration();

  String get durationText =>
      duration != null ? duration.toString().split('.').first : '';

  String get positionText =>
      position != null ? position.toString().split('.').first : '';

  bool playing = false;

  @override
  void initState() {
    getAudio();
    audioPlayer.onPlayerCompletion.listen((event) async {
      await audioPlayer.release();
      Navigator.pop(context);
      setState(() {
        position = duration;
      });
    });
    super.initState();
  }

  Future<double> _getSoundDuration() async {
    final audioDuration = await audioPlayer.getDuration();
    return audioDuration / 1000;
  }

  Widget getFileDuration() {
    return FutureBuilder<double>(
        future: _getSoundDuration(),
        builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
          return Slider.adaptive(
              value: position.inSeconds.toDouble() ?? 60.0,
              max: snapshot.data ?? 60.0,
              onChanged: (double value) => {
                    setState(() {
                      final Duration newDuration =
                          Duration(seconds: value.toInt());
                      audioPlayer.seek(newDuration);
                    })
                  });
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image(
                  image: FirebaseImage(widget.sound.imageUrl),
                  height: 350,
                  width: 350),
            ),
            Column(
              children: [
                getFileDuration(),
                Text(
                  position != null
                      ? "${positionText ?? ''} / ${durationText ?? ''}"
                      : '',
                  style: const TextStyle(fontSize: 24.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: FloatingActionButton(
                    onPressed: () => getAudio(),
                    backgroundColor: Colors.blue,
                    child: Icon(
                      playing == false
                          ? Icons.play_circle_filled_outlined
                          : Icons.pause_circle_filled_outlined,
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            WaveWidget(
              duration: 1,
              config: CustomConfig(
                gradients: [
                  [const Color(0xFF3A2DB3), const Color(0xFF3A2DB1)],
                  [const Color(0xFFEC72EE), const Color(0xFFFF7D9C)],
                  [const Color(0xFFfc00ff), const Color(0xFF00dbde)],
                  [const Color(0xFF396afc), const Color(0xFF2948ff)]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                blur: const MaskFilter.blur(BlurStyle.inner, 5),
                gradientBegin: Alignment.centerLeft,
                gradientEnd: Alignment.centerRight,
              ),
              waveAmplitude: 1,
              backgroundColor: Colors.white,
              size: const Size(double.infinity, 200.0),
            ),
          ],
        ),
      ),
    );
  }

  Future getAudio() async {
    //playing is false by default
    await audioPlayer.setUrl(widget.sound.soundUrl);
    await audioPlayer.setReleaseMode(ReleaseMode.STOP);
    final audioDuration = await audioPlayer.getDuration();

    duration = Duration(milliseconds: audioDuration);

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
    audioPlayer.onDurationChanged.listen((Duration d) {
      setState(() => duration = d);
    });

    audioPlayer.onAudioPositionChanged.listen((Duration d) {
      setState(() => position = d);
    });

    audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
    });
  }
}
