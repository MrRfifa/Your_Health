import 'package:flutter/material.dart';
import 'package:your_health/models/ur_health_obj.dart';

class HealTile extends StatelessWidget {
  final ur_health_obj? heal;
  HealTile({this.heal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green,
          ),
          title: Text(heal!.nom),
          subtitle: Text('color is ${heal!.color}'),
        ),
      ),
    );
  }
}
