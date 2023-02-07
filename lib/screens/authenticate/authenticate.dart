import 'package:coffee/screens/authenticate/register.dart';
import 'package:coffee/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Register());
  }
}
