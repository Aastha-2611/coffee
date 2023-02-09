import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/brew.dart';

class DataBaseServices {
  final String? uid;
  DataBaseServices({this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');

  Future updateUserData(String sugar, String name, String strength) async {
    return await brewCollection
        .doc(uid)
        .set({sugar: sugar, name: name, strength: strength});
  }

  List<Brew> _brewlistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data().toString().contains('name') ? doc.get('name') : '0',
        strength: doc.data().toString().contains('strength')
            ? doc.get('strength')
            : 'new user',
        sugar: doc.data().toString().contains('sugars')
            ? doc.get('sugars')
            : 'medium',
      );
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewlistFromSnapshot);
  }
}