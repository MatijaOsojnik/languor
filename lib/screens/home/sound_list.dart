import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';
import 'package:Languor/screens/home/sound_tile.dart';

class SoundList extends StatefulWidget {
  @override
  _SoundListState createState() => _SoundListState();
}

class _SoundListState extends State<SoundList> {
  @override
  Widget build(BuildContext context) {
    final sounds = Provider.of<List<Sound>>(context);
    return ListView.builder(
        itemCount: sounds.length,
        itemBuilder: (context, index) {
          return SoundTile(sound: sounds[index]);
        });
  }
}
