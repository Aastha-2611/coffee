import 'package:coffee/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final toggleView;

  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value!.isEmpty ? 'Enter Email' : null,
                        decoration: const InputDecoration(
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                          hintStyle: TextStyle(color: Colors.black),
                          iconColor: Colors.black,
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
                        validator: (value) => value!.length < 6
                            ? 'Password must be more than 6 characters'
                            : null,
                        decoration: InputDecoration(
                          icon: Icon(Icons.password),
                          labelText: 'Enter password',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.black),
                          iconColor: Colors.black,
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
                          color: Colors.black,
                        ),
                        title: Row(
                          children: [
                            Text(
                              'New User? ',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  widget.toggleView();
                                },
                                child: Text(
                                  'Sign Up ',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 60),
                      Center(
                          child: OutlinedButton(
                        onPressed: () async {},
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromARGB(255, 126, 77, 59)),
                        ),
                      ))
                    ],
                  ),
                ))));
  }
}
