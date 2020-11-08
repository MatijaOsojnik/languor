import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';
import 'package:Languor/screens/home/sound_tile.dart';
import 'package:Languor/screens/sound/sound_screen.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:Languor/shared/loading.dart';

class SoundList extends StatefulWidget {
  @override
  _SoundListState createState() => _SoundListState();
}

class _SoundListState extends State<SoundList> {
  @override
  Widget build(BuildContext context) {
    final sounds = Provider.of<List<Sound>>(context);
    if (sounds != null) {
      return SingleChildScrollView(
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Use children total size
            children: [
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 10.0),
                      child: Text(
                        "Today's pick",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20.0),
                      )),
                ],
              ),
              Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 5.0),
                  child: InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SoundScreen(
                                    sound: sounds[0],
                                  )))
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              // ignore: unnecessary_string_interpolations
                              '${sounds[0].name.toUpperCase()}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Image(
                          image: FirebaseImage(sounds[0].imageUrl),
                          fit: BoxFit.cover,
                        ),
                        const Divider(),
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.play_arrow,
                                      size: 20.0,
                                      color: Colors.blue[300],
                                    ),
                                  ),
                                  TextSpan(
                                      text: " Play",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.blue[300],
                                      )),
                                ],
                              ),
                            )),
                      ],
                    ),
                  )),
              Row(
                children: const [
                  Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 10.0),
                      child: Text(
                        'All Sounds',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20.0),
                      )),
                ],
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: sounds.length - 1 > 0 ? sounds.length - 1 : 0,
                  itemBuilder: (context, index) {
                    index += 1;
                    return SoundTile(sound: sounds[index]);
                  }),
            ],
          ),
        ),
      );
    } else {
      return Loading();
    }
  }
}
