import 'package:flutter/material.dart';

class MUser {
  final String? uid;

  MUser({this.uid});
}

class UserData {
  final String? uid;
  final String? name;
  final String? sugar;
  final String? strength;
  UserData({this.uid, this.name, this.sugar, this.strength});
}
