import 'package:flutter/material.dart';

class OwnedEquipment extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OwnedEquipmentState createState() => _OwnedEquipmentState();
}

class _OwnedEquipmentState extends State<OwnedEquipment> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;

  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      // Do something with the entered parameters
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsetsDirectional.all(100),
                child: Text(
                  'Already Owned Equipment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              CheckboxListTile(
                title: const Text('Dumbbells'),
                value: checkboxValue1,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue1 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Treadmill'),
                value: checkboxValue2,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue2 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Bench'),
                value: checkboxValue3,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue3 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Fixed Bar'),
                value: checkboxValue4,
                onChanged: (bool? value) {
                  setState(() {
                    checkboxValue4 = value!;
                  });
                },
              ),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
