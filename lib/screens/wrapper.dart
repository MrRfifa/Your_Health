import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_health/models/user.dart';
import 'package:your_health/screens/authenticate/authenticate.dart';
import 'package:your_health/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<TheUser?>(context);
    print(user);
    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
