import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';
import 'package:firebase_image/firebase_image.dart';
import 'package:Languor/screens/sound/sound_screen.dart';

class SoundTile extends StatelessWidget {
  final Sound sound;
  const SoundTile({this.sound});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
            elevation: 10.0,
            margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 2.0),
            child: InkWell(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SoundScreen(
                              sound: sound,
                            )))
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    // ignore: unnecessary_string_interpolations
                    '${sound.name.toUpperCase()}',
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Image(
                    image: FirebaseImage(sound.imageUrl),
                    height: 150,
                    width: 200,
                  ),
                ],
              ),
            )

            // child: ListTile(
            //   leading: Image(
            //     image: FirebaseImage(sound.imageUrl),
            //     fit: BoxFit.fill,
            //   ),
            //   title: Text(sound.name),
            //   subtitle: Text(sound.description),
            //   contentPadding: const EdgeInsets.all(30.0),
            //   onTap: () => {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => SoundScreen(
            //                   sound: sound,
            //                 )))
            //   },
            // )),
            ));
  }
}
