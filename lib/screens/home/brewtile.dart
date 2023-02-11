import 'package:flutter/material.dart';

import '../../models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew? brew;

  const BrewTile({super.key, this.brew});

  @override
  Widget build(BuildContext context) {
    String name = brew?.name ?? 'new user';

    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.brown,
        ),
        title: Text(name),
      ),
    );
  }
}
