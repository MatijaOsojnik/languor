import 'package:flutter/material.dart';
import 'package:Languor/models/sound.dart';
import 'package:provider/provider.dart';
import 'package:Languor/services/database.dart';

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
            appBar: AppBar(
              actions: [
                IconButton(
                  key: const ValueKey("goBack"),
                  icon: const Icon(Icons.exit_to_app),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            body: Container(
              child: Text(sound.name),
            ),
          ),
        ));
  }
}
