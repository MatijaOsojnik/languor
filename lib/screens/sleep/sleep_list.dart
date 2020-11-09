import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';
import 'package:Languor/screens/home/sound_tile.dart';

class SleepList extends StatefulWidget {
  final List<Sound> sounds;
  const SleepList({this.sounds});
  @override
  _SleepListState createState() => _SleepListState();
}

class _SleepListState extends State<SleepList> {
  @override
  Widget build(BuildContext context) {
    // final sounds = Provider.of<List<Sound>>(context);
    // final categories = Provider.of<List<Category>>(context);
    return SingleChildScrollView(
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 10.0),
                    child: Text(
                      widget.sounds[0].category,
                      textAlign: TextAlign.start,
                      style: const TextStyle(fontSize: 20.0),
                    )),
              ],
            ),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: widget.sounds.length,
                itemBuilder: (context, index) {
                  return SoundTile(sound: widget.sounds[index]);
                })
          ],
        ),
      ),
    );
  }
}
