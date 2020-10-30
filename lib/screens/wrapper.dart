import 'package:Languor/screens/authentication/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:Languor/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // ignore: avoid_print
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
