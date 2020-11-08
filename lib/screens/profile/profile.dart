import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Languor/screens/profile/achievements.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.account_circle_sharp,
                  size: 100, color: Colors.blue[200]),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Text(user.email.substring(0, user.email.indexOf('@')),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))),
            Expanded(
              child: DefaultTabController(
                  length: 2,
                  child: Column(children: <Widget>[
                    Container(
                      constraints: const BoxConstraints(maxHeight: 150.0),
                      child: const Material(
                        color: Colors.white,
                        child: TabBar(
                          tabs: [
                            Tab(
                              child: Text(
                                'Achievements',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Skills',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                              //     icon: Icon(
                              //   Icons.directions_transit,
                              //   color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Achievements(),
                          const Icon(Icons.directions_transit),
                        ],
                      ),
                    ),
                  ])),
            )
          ],
        ));
  }
}
