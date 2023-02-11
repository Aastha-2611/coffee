import 'package:coffee/models/user.dart';
import 'package:coffee/services/firebase.dart';
import 'package:coffee/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugar = ['0', '1', '2', '3', '4'];
  final List<String> strength = ['light', 'medium', 'strong'];
  String? _currentName;
  String? _currentSugar;
  String? _currentStrenght;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MUser?>(context);
    print(user?.uid);
    String uid = user?.uid ?? '0';

    return StreamBuilder<UserData>(
        stream: DataBaseServices(uid: uid).userModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('in settings if ');

            UserData? userdata = snapshot.data;
            String name = userdata?.name ?? 'new user';
            String sugarUser = userdata?.sugar ?? '0';
            String strengthUser = userdata?.strength ?? 'medium';
            print('$name,$sugarUser,$strengthUser ');

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
                        initialValue: name,
                        decoration: InputDecoration(
                          labelText: 'Enter your name',
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'enter name' : null,
                        onChanged: (value) => setState(() {
                          _currentName = value;
                        }),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField(
                          value: _currentSugar ?? '0',
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
                          //value: _currentStrenght ?? strengthUser,
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
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            await DataBaseServices(uid: uid).updateUserData(
                                _currentSugar ?? sugarUser,
                                _currentName ?? name,
                                _currentStrenght ?? strengthUser);

                            Navigator.pop(context);
                          }
                        },
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
          } else {
            return Loading();
          }
        });
  }
}
