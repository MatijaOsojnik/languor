import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';
import 'package:provider/provider.dart';
import 'package:Languor/services/database.dart';
import 'package:Languor/screens/sound/audio.dart';

class SoundScreen extends StatelessWidget {
  final Sound sound;
  const SoundScreen({this.sound});
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Sound>>.value(
        initialData: const [],
        value: DatabaseService().sounds,
        child: MaterialApp(
            home: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: IconButton(
                    key: const ValueKey("goBack"),
                    icon: const Icon(Icons.cancel_sharp),
                    iconSize: 30.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                sound.name,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                sound.description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Image(
                          image: FirebaseImage(sound.imageUrl),
                          height: 300,
                          width: 300,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.blue,
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AudioWidget(
                                                sound: sound,
                                              )))
                                },
                                child: const Text(
                                  'Begin',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ))
                      ],
                    ),
                  ],
                ))));
  }
}
