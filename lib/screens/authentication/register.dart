import 'package:flutter/material.dart';
import 'package:Languor/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Register'),
        actions: [
          FlatButton.icon(
              onPressed: () {}, icon: Icon(Icons.person), label: Text('Login'))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Builder(builder: (BuildContext context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  key: const ValueKey("email"),
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Email"),
                  controller: _emailController,
                ),
                TextFormField(
                  key: const ValueKey("password"),
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "Password"),
                  controller: _passwordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  key: const ValueKey("signIn"),
                  onPressed: () async {
                    final String retVal = await _auth.signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (retVal == "Success") {
                      _emailController.clear();
                      _passwordController.clear();
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal),
                        ),
                      );
                    }
                  },
                  child: const Text("Sign In"),
                ),
                FlatButton(
                  key: const ValueKey("createAccount"),
                  onPressed: () async {
                    final String retVal = await _auth.createAccount(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    if (retVal == "Success") {
                      _emailController.clear();
                      _passwordController.clear();
                    } else {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(retVal),
                        ),
                      );
                    }
                  },
                  child: const Text("Create Account"),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
