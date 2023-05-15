import 'package:flutter/material.dart';
import 'package:gym_home/pages/bottom_bar.dart';
import 'package:gym_home/pages/shopping.dart';
import 'package:gym_home/pages/tracking.dart';
import 'package:gym_home/pages/workouts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const TrackingPage(),
    const WorkoutsPage(),
    const ShopPage(),
  ];

  void _submit() {
    if (_index != 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pages[_index]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeGym"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Welcome Home',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        // Use the BottomNavBar widget
        currentIndex: _index,
        onTap: (int value) {
          setState(() {
            _index = value;
          });
          _submit();
        },
      ),
    );
  }
}
