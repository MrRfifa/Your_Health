import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:your_health/models/ur_health_obj.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({
    this.uid,
  });

  //collection reference
  final CollectionReference healCollection =
      FirebaseFirestore.instance.collection('health');

  Future updateUserData(String nom, String prenom, String col, int age) async {
    return await healCollection
        .doc(uid)
        .set({'nom': nom, 'prenom': prenom, 'color': col, 'age': age});
  }

  // ur_health list from snapshot
  Iterable<ur_health_obj> _urHealthListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return ur_health_obj(
          nom: e.get('nom') ?? '',
          prenom: e.get('prenom') ?? '',
          color: e.get('color') ?? '',
          age: e.get('age') ?? 0);
    }).toList();
  }

  //get stream
  Stream<Iterable<ur_health_obj>> get healths {
    return healCollection.snapshots().map(_urHealthListFromSnapshot);
  }
}
