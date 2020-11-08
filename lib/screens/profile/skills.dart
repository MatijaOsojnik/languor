import 'package:flutter/material.dart';
import 'package:Languor/models/skill.dart';
import 'package:Languor/services/database.dart';
import 'package:Languor/screens/profile/skill_tile.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Skill>>(
        stream: DatabaseService().skills,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final skills = snapshot.data;
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: skills.length,
                itemBuilder: (context, index) {
                  return SkillTile(skill: skills[index]);
                });
          } else {
            return Container();
          }
        });
    // return  ListView.builder(
    //             physics: const NeverScrollableScrollPhysics(),
    //             shrinkWrap: true,
    //             itemCount: sounds.length - 1 > 0 ? sounds.length - 1 : 0,
    //             itemBuilder: (context, index) {
    //               index += 1;
    //               return SoundTile(sound: sounds[index]);
    //             }),
  }
}
