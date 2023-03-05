import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserAuth {
  final String? id;
  UserAuth({this.id});
}

class UserData {
  final String? id;
  final String? name;
  final String? sugar;
  final String? strength;
  UserData({this.id, this.name, this.sugar, this.strength});

  //to read data

  factory UserData.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> snap = snapshot.data() as Map<String, dynamic>;

    return UserData(
        id: snap['id'],
        name: snap['name'],
        sugar: snap['sugar'],
        strength: snap['strength']);
  }

// to write data
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'sugar': sugar, 'strength': strength};
}
