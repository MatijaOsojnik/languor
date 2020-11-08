import 'package:flutter/material.dart';
import 'package:Languor/models/achievement.dart';
import 'package:firebase_image/firebase_image.dart';

class AchievementTile extends StatelessWidget {
  final Achievement achievement;
  const AchievementTile({this.achievement});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: Image(
            image: FirebaseImage(achievement.imageUrl),
            fit: BoxFit.fill,
          ),
          title: Text(achievement.name),
          subtitle: Text(achievement.description),
          contentPadding: const EdgeInsets.all(30.0),
          // onTap: () => {
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => SoundScreen(
          //                 sound: sound,
          //               )))
          // },
        ));
  }
}
