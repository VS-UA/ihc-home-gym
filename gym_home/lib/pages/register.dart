import 'package:flutter/material.dart';
import 'package:gym_home/pages/home.dart';
import 'package:gym_home/pages/setup.dart';

import 'equipment.dart';
import 'goal.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _controller = PageController(
    initialPage: 0,
  );

  void _animateTo(int page) {
    if (_controller.hasClients) {
      _controller.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        UserDataPage(
          onPrevious: () {
            Navigator.pop(context);
          },
          onNext: () {
            _animateTo(1);
          },
        ),
        GoalDataPage(
          onPrevious: () {
            _animateTo(0);
          },
          onNext: () {
            _animateTo(2);
          },
        ),
        EquipmentDataPage(
          onPrevious: () {
            _animateTo(1);
          },
          onNext: () {
            const snackBar = SnackBar(
              content: Text(
                'Account created succesfully!',
                textAlign: TextAlign.center,
              ),
            );

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ],
    );
  }
}
