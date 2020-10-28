import 'package:Languor/screens/authentication/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Languor/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // ignore: avoid_print
    if (user == null) {
      return Authenticate();
    } else {
      return Home(
        auth: _auth,
        firestore: _firestore,
      );
    }
  }
}
