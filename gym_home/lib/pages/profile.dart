import 'package:flutter/material.dart';

class UserProfile {
  String name;
  int age;
  double weight;
  double height;
  String fitnessGoal;

  UserProfile(
      {required this.name,
      required this.age,
      required this.weight,
      required this.height,
      required this.fitnessGoal});
}

class UserProfileForm extends StatefulWidget {
  const UserProfileForm({Key? key}) : super(key: key);

  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final userProfile = UserProfile(
    name: '',
    age: 0,
    weight: 0,
    height: 0,
    fitnessGoal: '',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  userProfile.name = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your age',
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onSaved: (value) {
                  userProfile.age = int.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your weight in kg',
                  labelText: 'Weight',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
                onSaved: (value) {
                  userProfile.weight = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your height in cm',
                  labelText: 'Height',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
                onSaved: (value) {
                  userProfile.height = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your fitness goal',
                  labelText: 'Fitness Goal',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your fitness goal';
                  }
                  return null;
                },
                onSaved: (value) {
                  userProfile.fitnessGoal = value!;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Save user profile to database
                    }
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}