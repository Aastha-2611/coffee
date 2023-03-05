import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/user.dart';

class FireBaseHelper {
  String? uid;

  FireBaseHelper({this.uid});

  final userCollection = FirebaseFirestore.instance.collection('users');

  Future create(UserData userData) async {
    final docRef = userCollection.doc(uid);
    final user = UserData(
      id: uid,
      name: userData.name,
      sugar: userData.sugar,
      strength: userData.strength,
    ).toJson();

    try {
      await docRef.set(user);
    } catch (e) {
      print('some error in creating');
    }
  }

  //stream to read data
  Stream<List<UserData>> get read {
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => UserData.fromSnapshot(e)).toList());
  }

  //update user
  Future update(UserData user) async {
    final docref = userCollection.doc(user.id);

    final newUser = UserData(
            id: user.id,
            strength: user.strength,
            name: user.name,
            sugar: user.sugar)
        .toJson();

    try {
      await docref.update(newUser);
    } catch (e) {
      print('error in updating');
    }
  }

  //get logged in user
  Stream<UserData> get loggedInUser {
    return userCollection
        .doc(uid)
        .snapshots()
        .map((e) => UserData.fromSnapshot(e));
  }
}
