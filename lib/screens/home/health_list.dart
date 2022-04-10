import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/ur_health_obj.dart';
import 'heal_tile.dart';

class HealthList extends StatefulWidget {
  @override
  State<HealthList> createState() => _HealthListState();
}

class _HealthListState extends State<HealthList> {
  @override
  Widget build(BuildContext context) {
    final heals = Provider.of<Iterable<ur_health_obj>>(context);

    return ListView.builder(
        itemCount: heals.length,
        itemBuilder: (context, index) {
          return HealTile(heal: heals.elementAt(index));
        });
  }
}
