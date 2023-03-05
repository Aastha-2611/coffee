import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brewtile.dart';

class ListData extends StatefulWidget {
  const ListData({super.key});

  @override
  State<ListData> createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    final listData = Provider.of<List<UserData>>(context);
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return SingleUser(
          user: listData[index],
        );
      },
    );
  }
}
