import 'package:flutter/material.dart';
import 'brewlist.dart';
import 'package:coffee/models/user.dart';

class SingleUser extends StatelessWidget {
  final UserData? user;
  const SingleUser({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    print('in brewtile');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        child: ListTile(
          title: Text(
            '${user!.name}',
            textAlign: TextAlign.left,
          ),
          subtitle: Text(
            'takes ${user!.sugar} sugars',
            textAlign: TextAlign.left,
          ),
          trailing: Text('${user!.strength} strength'),
        ),
      ),
    );
  }
}
