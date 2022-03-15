import 'package:flutter/material.dart';
import 'package:your_health/services/auth.dart';
import 'package:your_health/shared/constants.dart';
import 'package:your_health/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.greenAccent,
            appBar: AppBar(
              backgroundColor: Colors.greenAccent[400],
              title: const Text('Sign up to Your Health'),
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Sign in'))
              ],
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) =>
                          val!.isEmpty ? 'enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
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
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                    ),
                    const SizedBox(height: 20.0),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => loading = true);
                          dynamic result =
                              await _auth.Register(email, password);
                          if (result == null) {
                            setState(() {
                              error = 'please supply a valid email';
                              loading = false;
                            });
                          }
                        }
                      },
                      color: Colors.greenAccent[400],
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(error,
                        style:
                            const TextStyle(color: Colors.red, fontSize: 14.0)),
                  ],
                ),
              ),
            ));
  }
}
