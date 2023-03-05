import 'package:coffee/screens/home/updateform.dart';
import 'package:coffee/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:coffee/models/user.dart';
import 'package:provider/provider.dart';

class ShowSettings extends StatefulWidget {
  const ShowSettings({super.key});

  @override
  State<ShowSettings> createState() => _ShowSettingsState();
}

class _ShowSettingsState extends State<ShowSettings> {
  UserData? loggedUser;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);
    final userId = user!.id;
    return StreamBuilder<UserData>(
      stream: FireBaseHelper(uid: userId).loggedInUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          {
            loggedUser = snapshot.data;

            return UpdateForm(
              user: loggedUser,
            );
          }
        }

        if (snapshot.hasError) {
          return Center(
            child: Text('some error occured'),
          );
        }

        return CircularProgressIndicator(
          color: Colors.cyan,
        );
      },
    );
  }
}
