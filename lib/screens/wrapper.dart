import 'package:coffee/screens/authenticate/authenticate.dart';
import 'package:coffee/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserAuth?>(context);
    if (user == null)
      return Authenticate();
    else
      return Home();
  }
}
