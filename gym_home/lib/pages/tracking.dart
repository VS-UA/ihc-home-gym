import 'package:flutter/material.dart';
import 'package:gym_home/pages/home.dart';
import 'package:gym_home/pages/bottom_bar.dart';
import 'package:gym_home/pages/shop.dart';
import 'package:gym_home/pages/workouts.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  int _index = 1;

  final List<Widget> _pages = [
    const HomePage(),
    const TrackingPage(),
    const WorkoutsPage(),
    const ShopPage(),
  ];

  void _submit() {
    if (_index != 1) {
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
        title: const Text("Tracking"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Tracking',
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
