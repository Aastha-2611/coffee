import 'dart:ffi';

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 128, 93, 81),
      appBar: AppBar(
        title: Text('Brewww'),
        backgroundColor: Color.fromARGB(255, 132, 90, 74),
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
              SizedBox(
                height: 40,
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        )),
      ),
    );
  }
}
