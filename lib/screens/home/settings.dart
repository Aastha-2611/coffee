import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  GlobalKey _formkey = GlobalKey<FormState>();
  final List<String> sugar = ['0', '1', '2', '3', '4'];
  final List<String> strength = ['light', 'medium', 'strong'];
  String? _currentName;
  String? _currentSugar;
  String? _currentStrenght;

  @override
  Widget build(BuildContext context) {
    print('in settings form');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: _formkey,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Update your coffee',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                ),
                validator: (value) => value!.isEmpty ? 'enter name' : null,
                onChanged: (value) => setState(() {
                  _currentName = value;
                }),
              ),
              SizedBox(
                height: 8,
              ),
              DropdownButtonFormField(
                  items: sugar.map((sugar) {
                    return DropdownMenuItem(
                        value: sugar, child: Text('$sugar Sugars'));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _currentSugar = value;
                    });
                  }),
              SizedBox(
                height: 8,
              ),
              DropdownButtonFormField(
                  items: strength.map((strength) {
                    return DropdownMenuItem(
                        value: strength, child: Text('$strength'));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _currentStrenght = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 228, 197, 186))),
              )
            ],
          )),
    );
  }
}
