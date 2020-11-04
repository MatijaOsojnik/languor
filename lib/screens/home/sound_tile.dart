import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';
import 'package:firebase_image/firebase_image.dart';

class SoundTile extends StatelessWidget {
  final Sound sound;
  const SoundTile({this.sound});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
          elevation: 10.0,
          margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
          child: ListTile(
            leading: Image(
              image: FirebaseImage(sound.imageUrl),
              fit: BoxFit.fill,
            ),
            // leading: CircleAvatar(
            //   backgroundColor: Colors.blue,
            //   radius: 25.0,
            // ),
            title: Text(sound.name),
            subtitle: Text(sound.description),
            contentPadding: const EdgeInsets.all(30.0),
          )),
    );
  }
}
