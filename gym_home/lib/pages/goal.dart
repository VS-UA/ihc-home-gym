import 'package:flutter/material.dart';
import 'package:gym_home/pages/equipment.dart';

class ObjectivesPage extends StatefulWidget {
  const ObjectivesPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ObjectivesPageState createState() => _ObjectivesPageState();
}

final List<int> number_of_days = [1,2,3,4,5,6,7];

class _ObjectivesPageState extends State<ObjectivesPage>{
  
  int dropdownValue = number_of_days.first;
  
  void _submit() {
    // Do something with the entered parameters

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EquipmentPage()),
    );
    
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Objectives'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ), child: const Text('Weight loss'), onPressed: () {
                _submit();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ), child: const Text('Muscle mass'), onPressed: () {
                _submit();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
              ), child: const Text('Fitness'), onPressed: () {
                _submit();
              },
            ),
            const Text(
              'How many days per week do you want to train?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<int>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward_rounded),
              elevation: 4,
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (int? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: number_of_days.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),

          ],
        ),
      ),
    );
  }
}
