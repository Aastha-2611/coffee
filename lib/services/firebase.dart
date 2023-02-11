import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/brew.dart';
import 'package:coffee/models/user.dart';

class DataBaseServices {
  final String? uid;
  DataBaseServices({this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brew');

  Future updateUserData(String? sugar, String? name, String? strength) async {
    return await brewCollection
        .doc(uid)
        .set({sugar!: sugar, name!: name, strength!: strength});
  }

  List<Brew> _brewlistFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc.data().toString().contains('name')
            ? doc.get('name')
            : 'new member',
        strength: doc.data().toString().contains('strength')
            ? doc.get('strength')
            : 'medium',
        sugar:
            doc.data().toString().contains('sugars') ? doc.get('sugars') : '0',
      );
    }).toList();
  }

  UserData _userDataFromSnapshots(DocumentSnapshot snapshot) {
    return UserData(
      uid: snapshot.data().toString().contains('uid')
          ? snapshot.get('uid')
          : '0',
      name: snapshot.data().toString().contains('name')
          ? snapshot.get('name')
          : 'new user',
      sugar: snapshot.data().toString().contains('sugar')
          ? snapshot.get('sugar')
          : '0 sugars',
      strength: snapshot.data().toString().contains('strength')
          ? snapshot.get('strength')
          : 'medium',
    );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewlistFromSnapshot);
  }

  Stream<UserData> get userModel {
    print(uid);
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshots);
  }
}
