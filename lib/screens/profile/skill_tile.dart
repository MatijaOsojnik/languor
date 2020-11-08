import 'package:flutter/material.dart';
import 'package:Languor/models/skill.dart';
import 'package:firebase_image/firebase_image.dart';

class SkillTile extends StatelessWidget {
  final Skill skill;
  const SkillTile({this.skill});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          leading: Image(
            image: FirebaseImage(skill.imageUrl),
            fit: BoxFit.fill,
          ),
          title: Text(skill.name),
          subtitle: Text(skill.description),
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
