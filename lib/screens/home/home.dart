import 'package:coffee/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 145, 128),
      appBar: AppBar(
        title: Text('Brewfee!!! '),
        backgroundColor: Color.fromARGB(255, 172, 110, 87),
        actions: [
          OutlinedButton(
            onPressed: () async {
              await _auth.signOut();
            },
            child: Text('sign out'),
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 20, 19, 19)),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 152, 103, 86))),
          )
        ],
      ),
    );
  }
}
