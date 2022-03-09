import 'package:flutter/material.dart';
import 'package:your_health/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Colors.greenAccent[400],
          title: const Text('Sign in to Your Health'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person),
                label: Text('Register'))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/hello.png"), fit: BoxFit.cover),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  decoration: const InputDecoration(hintText: 'the email'),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val!.length < 6
                      ? 'The password must contain at least 6 chars'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  decoration: const InputDecoration(hintText: 'password'),
                ),
                const SizedBox(height: 20.0),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result = await _auth.signInweap(email, password);
                      if (result == null) {
                        setState(() =>
                            error = 'coud not sign in with those credentials');
                      }
                    }
                  },
                  color: Colors.greenAccent[400],
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(error,
                    style: const TextStyle(color: Colors.red, fontSize: 14.0)),
              ],
            ),
          ),
        ));
  }
}
