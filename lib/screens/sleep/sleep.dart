import 'package:flutter/material.dart';
import 'package:Languor/services/database.dart';
import 'package:Languor/screens/sleep/sleep_list.dart';
import 'package:Languor/models/sound.dart';

class Sleep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Sound>>(
        stream: DatabaseService().sleepSounds,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: SleepList(
                sounds: snapshot.data,
              ),
            );
          } else {
            return const LinearProgressIndicator();
          }
        });
    // return StreamProvider<List<Sound>>.value(
    //   initialData: List(),
    //   value: DatabaseService().sleepSounds,
    //   child: Column(
    //     children: [
    //       Text('HI'),
    //       Expanded(
    //         //S temu sm se zajbavu 3 URE AAAAAAAAAAAAA
    //         child: SleepList(),
    //       )
    //     ],
    //   ),
    // );
  }
}
