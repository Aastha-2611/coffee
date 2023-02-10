import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/brew.dart';
import 'package:coffee/screens/home/settings.dart';
import 'package:coffee/services/auth.dart';
import 'package:coffee/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brewlist.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingsForm();
          });
    }

    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DataBaseServices().brews,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 190, 145, 128),
        appBar: AppBar(
          title: Text('Brewfee!!! '),
          backgroundColor: Color.fromARGB(255, 172, 110, 87),
          actions: [
            OutlinedButton.icon(
              onPressed: () {
                _showSettingsPanel(context);
              },
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 152, 103, 86)),
                foregroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 20, 19, 19)),
              ),
            ),
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
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 196, 149, 132),
                Color.fromARGB(255, 129, 87, 74),
                Color.fromARGB(255, 95, 56, 42),
              ],
            ),
          ),
          child: BrewList(),
        ),
      ),
    );
  }
}
