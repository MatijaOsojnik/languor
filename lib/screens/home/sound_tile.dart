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
            elevation: 2.0,
            margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 5.0),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      // ignore: unnecessary_string_interpolations
                      '${sound.name.toUpperCase()}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Image(
                      image: FirebaseImage(sound.imageUrl),
                      fit: BoxFit.cover,
                    ),
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
