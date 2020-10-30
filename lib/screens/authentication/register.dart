import 'package:Languor/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:Languor/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  const Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[800],
              title: const Text('Register'),
              actions: [
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(Icons.person),
                    label: const Text('Login'))
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
                        key: const ValueKey("createAccount"),
                        onPressed: () async {
                          setState(() => loading = true);
                          final String retVal = await _auth.createAccount(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          if (retVal == "Success") {
                            _emailController.clear();
                            _passwordController.clear();
                          } else {
                            setState(() => loading = false);
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(retVal),
                              ),
                            );
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                      // FlatButton(
                      //   key: const ValueKey("createAccount"),
                      //   onPressed: () async {
                      //     final String retVal = await _auth.createAccount(
                      //       email: _emailController.text,
                      //       password: _passwordController.text,
                      //     );
                      //     if (retVal == "Success") {
                      //       _emailController.clear();
                      //       _passwordController.clear();
                      //     } else {
                      //       Scaffold.of(context).showSnackBar(
                      //         SnackBar(
                      //           content: Text(retVal),
                      //         ),
                      //       );
                      //     }
                      //   },
                      //   child: const Text("Create Account"),
                      // )
                    ],
                  );
                }),
              ),
            ),
          );
  }
}
