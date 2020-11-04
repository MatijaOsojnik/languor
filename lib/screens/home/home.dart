import 'package:Languor/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Languor/services/database.dart';
import 'package:Languor/screens/home/sound_list.dart';
import 'package:Languor/models/sound.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamProvider<List<Sound>>.value(
      initialData: List(),
      value: DatabaseService().sounds,
      child: MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text("Languor"),
          centerTitle: true,
          actions: [
            IconButton(
              key: const ValueKey("signOut"),
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _auth.signOut();
              },
            )
          ],
        ),
        // body: Center(
        //   child: Text(user.email),
        // ),
        body: SoundList(),
      )),
    );
  }
}
