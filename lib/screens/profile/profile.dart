import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(Icons.account_circle_sharp,
                        size: 100, color: Colors.blue[200]),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(user.email,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  ],
                ),
                Text(user.email,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ));
  }
}
