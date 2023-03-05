import 'package:coffee/models/user.dart';
import 'package:coffee/services/firebase.dart';
import 'package:flutter/material.dart';

class UpdateForm extends StatefulWidget {
  final UserData? user;
  const UpdateForm({super.key, this.user});

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  TextEditingController? _nameController;
  TextEditingController? _sugarController;
  TextEditingController? _strengthController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.user!.name);
    _strengthController = TextEditingController(text: widget.user!.strength);
    _sugarController = TextEditingController(text: widget.user!.sugar);
    super.initState();
  }

  @override
  void dispose() {
    _nameController!.dispose();
    _strengthController!.dispose();
    _sugarController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _nameController,
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _sugarController,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: _strengthController,
            ),
            SizedBox(
              height: 10.0,
            ),
            OutlinedButton(
              onPressed: () {
                FireBaseHelper(uid: widget.user!.id).update(UserData(
                    name: _nameController!.text,
                    strength: _strengthController!.text,
                    sugar: _sugarController!.text,
                    id: widget.user!.id));
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
