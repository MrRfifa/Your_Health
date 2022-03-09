import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_health/models/user.dart';
import 'package:your_health/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:your_health/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<TheUser?>.value(
      catchError: (_, __) => null,
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
