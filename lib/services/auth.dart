import 'package:coffee/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MUser? _userFromFirebaseUser(dynamic user) {
    if (user != null) {
      return MUser(uid: user.uid);
    } else {
      return null;
    }
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      dynamic user = result.user;
      return _userFromFirebaseUser(user);
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }
}
