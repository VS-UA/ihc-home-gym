import 'package:flutter/material.dart';

class GoalDataPage extends StatefulWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const GoalDataPage({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GoalDataPageState createState() => _GoalDataPageState();
}

class _GoalDataPageState extends State<GoalDataPage>
    with AutomaticKeepAliveClientMixin {
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
      widget.onNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            widget.onPrevious();
          },
        ),
        title: const Center(child: Text('Goals')),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _submit,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
