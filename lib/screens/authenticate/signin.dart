import 'package:coffee/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 128, 93, 81),
        appBar: AppBar(
          title: Text('BREWWW'),
          backgroundColor: Color.fromARGB(255, 132, 90, 74),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image2.jfif'),
                    fit: BoxFit.cover)),
            child: Form(
                child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                      hintStyle: TextStyle(color: Colors.white),
                      iconColor: Colors.white,
                      icon: Icon(Icons.email),
                      labelText: 'E-mail ID',
                    ),
                    onChanged: (val) {
                      setState(() {
                        email = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.password),
                      labelText: 'Enter password',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                      iconColor: Colors.white,
                    ),
                    onChanged: (value) => setState(() {
                      password = value;
                    }),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    title: Row(
                      children: [
                        Text(
                          'New User? ',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              'sign up',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              textAlign: TextAlign.center,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ))));
  }
}
