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
  String error = '';
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
                      const Image(
                        image: AssetImage('assets/languor-logo-white.png'),
                        height: 100,
                        width: 100,
                      ), // load logo on top of the text fields)
                      Padding(
                          padding: const EdgeInsets.only(top: 70.0),
                          child: TextFormField(
                            key: const ValueKey("email"),
                            textAlign: TextAlign.center,
                            decoration:
                                const InputDecoration(hintText: "Email"),
                            controller: _emailController,
                          )),
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
                            setState(() => {loading = false, error = retVal});
                          }
                        },
                        child: const Text("Sign Up"),
                      ),
                      const SizedBox(height: 12.0),
                      Text(error,
                          style: TextStyle(
                              color: Colors.red[200], fontSize: 14.0)),
                    ],
                  );
                }),
              ),
            ),
          );
  }
}
