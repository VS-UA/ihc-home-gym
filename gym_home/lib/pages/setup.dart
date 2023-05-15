import 'package:flutter/material.dart';

class ParameterFormPage extends StatefulWidget {
  @override
  _ParameterFormPageState createState() => _ParameterFormPageState();
}

class _ParameterFormPageState extends State<ParameterFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _age = 0;
  double _weight = 0.0;
  double _height = 0.0;

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
        title: Text('Enter Parameters'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) => value!.isEmpty ? 'Age is required' : null,
                onSaved: (value) => _age = int.parse(value!),
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Weight (in kg)'),
                validator: (value) => value!.isEmpty ? 'Weight is required' : null,
                onSaved: (value) => _weight = double.parse(value!),
              ),
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Height (in meters)'),
                validator: (value) => value!.isEmpty ? 'Height is required' : null,
                onSaved: (value) => _height = double.parse(value!),
              ),
              SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
