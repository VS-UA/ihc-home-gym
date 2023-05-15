import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EquipmentPageState createState() => _EquipmentPageState();
}


class _EquipmentPageState extends State<EquipmentPage>{
  final _formKey = GlobalKey<FormState>();
  int _toggleIndex = 1;
  double _budget = 0.0;


  void _submit() {
    // Do something with the entered parameters
    /*
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Page()),
    );
    */
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                    width: 260,
                    child: Text(
                      'Do you have equipment?',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                
                SizedBox(
                  width: 101,
                  height: 30,
                  child: ToggleSwitch(
                    customWidths: const [50.0, 50.0],
                    cornerRadius: 20.0,
                    activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const ['', ''],
                    icons: const [FontAwesomeIcons.check, FontAwesomeIcons.times],
                    initialLabelIndex: 1,
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                    width: 260,
                    child: Text(
                      'Do you want to buy equipment?',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  width: 101,
                  height: 30,
                  child: ToggleSwitch(
                    customWidths: const [50.0, 50.0],
                    cornerRadius: 20.0,
                    activeBgColors: const [[Colors.cyan], [Colors.redAccent]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const ['', ''],
                    icons: const [FontAwesomeIcons.check, FontAwesomeIcons.times],
                    initialLabelIndex: _toggleIndex,
                    onToggle: (index) {
                      setState(() {
                        _toggleIndex = index!;
                      });
                      print('switched to: $index');
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 55,
            child: Visibility(
              visible: _toggleIndex == 0,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 30.0),
                    child: SizedBox(
                      width: 260,
                      child: Text(
                        'Budget',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0, top: 40.0),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Enter budget €',
                          ),
                          validator: (value) => value!.isEmpty ? 'Budget is required' : null,
                          onSaved: (value) {
                            _budget = double.parse(value!);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}