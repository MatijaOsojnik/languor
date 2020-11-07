import 'package:Languor/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Languor/services/database.dart';
import 'package:Languor/screens/home/sound_list.dart';
import 'package:Languor/models/sound.dart';
import 'package:Languor/screens/profile/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    SoundList(),
    SoundList(),
    Profile(),
  ];
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
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
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Today',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'Sleep',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            )
          ],
        ),
        // body: Center(
        //   child: Text(user.email),
        // ),
        body: _children[_currentIndex],
      )),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
