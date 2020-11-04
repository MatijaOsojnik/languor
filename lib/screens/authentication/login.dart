import 'package:Languor/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:Languor/services/auth.dart';

class Login extends StatefulWidget {
  // final FirebaseAuth auth;
  // final FirebaseFirestore firestore;

  // const Login({
  //   Key key,
  //   @required this.auth,
  //   @required this.firestore,
  // }) : super(key: key);

  final Function toggleView;
  const Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              title: const Text('Login'),
              actions: [
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: const Icon(Icons.person),
                    label: const Text('Register'))
              ],
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Builder(builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image(image: AssetImage('assets/languor-logo.png')), // load logo on top of the text fields
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
                          setState(() => loading = true);

                          final String retVal = await _auth.signIn(
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
                        child: const Text("Sign In"),
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
