import 'package:flutter/material.dart';
import 'package:your_health/services/auth.dart';
import 'package:your_health/services/database.dart';
import 'package:provider/provider.dart';

import '../../models/ur_health_obj.dart';
import 'health_list.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Iterable<ur_health_obj>?>.value(
      initialData: null,
      value: DatabaseService().healths,
      child: Scaffold(
        backgroundColor: Colors.greenAccent[50],
        appBar: AppBar(
          title: const Text('Your Health'),
          backgroundColor: Colors.greenAccent[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                })
          ],
        ),
        body: HealthList(),
      ),
    );
  }
}
