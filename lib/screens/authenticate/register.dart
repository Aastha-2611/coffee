import 'package:flutter/material.dart';
import '../../services/auth.dart';

class Register extends StatefulWidget {
  final toggleView;

  const Register({super.key, required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 93, 81),
      appBar: AppBar(
        title: Text('Brewww'),
        backgroundColor: Color.fromARGB(255, 132, 90, 74),
        actions: [
          ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromARGB(255, 132, 90, 74),
              )),
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.login),
              label: Text('Sign in'))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/image2.jfif'),
          fit: BoxFit.cover,
        )),
        child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => value!.isEmpty ? 'Enter Email' : null,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      icon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) => value!.length < 6
                        ? 'Password must be more than 6 characters'
                        : null,
                    decoration: InputDecoration(
                      label: Text('Enter password'),
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      icon: Icon(Icons.password),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 12),
                  OutlinedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null)
                            setState(() {
                              error = 'Enter valid Email or password';
                            });
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    error,
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
