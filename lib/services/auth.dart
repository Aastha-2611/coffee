import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/user.dart';
import 'package:coffee/services/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserAuth? userToModel(User? user) {
    return user != null ? UserAuth(id: user.uid) : null;
  }

  // stream for auth change
  Stream<UserAuth?> get user {
    return _auth.authStateChanges().map((User? user) => userToModel(user));
  }

  //signIn

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return userToModel(user);
    } catch (e) {
      print(e.toString());
    }
  }

  //signUp

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (user != null) {
        await FireBaseHelper(uid: user.uid).create(UserData(
            id: user.uid, strength: 'medium', name: 'new member', sugar: '2'));
        return userToModel(user);
      } else
        return null;
    } catch (e) {
      print('error in signing up');
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('error signing out');
    }
  }
}
