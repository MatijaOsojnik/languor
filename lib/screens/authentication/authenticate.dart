import 'package:flutter/material.dart';
import 'package:Languor/screens/authentication/login.dart';
import 'package:Languor/screens/authentication/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login();
    } else {
      return Register();
    }
  }
}
