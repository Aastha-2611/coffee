import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/user.dart';
import 'package:coffee/screens/home/brewlist.dart';

import 'package:coffee/screens/home/settings.dart';
import 'package:coffee/services/auth.dart';
import 'package:coffee/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    void Settings() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10.0),
            child: ShowSettings(),
          );
        },
      );
    }

    return StreamProvider<List<UserData>>.value(
      initialData: [],
      value: FireBaseHelper().read,
      child: Scaffold(
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
            ),
            OutlinedButton.icon(
                onPressed: () => Settings(),
                icon: Icon(Icons.settings),
                label: Text('Setting')),
          ],
        ),
        body: ListData(),
      ),
    );
  }
}
