import 'package:flutter/material.dart';
import 'package:Languor/models/achievement.dart';
import 'package:Languor/services/database.dart';
import 'package:Languor/screens/profile/achievement_tile.dart';
import 'package:Languor/shared/loading.dart';

class Achievements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Achievement>>(
        stream: DatabaseService().achievements,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final achievements = snapshot.data;
            return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  return AchievementTile(achievement: achievements[index]);
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
