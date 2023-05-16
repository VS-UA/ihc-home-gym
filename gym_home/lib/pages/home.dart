import 'package:flutter/material.dart';
import 'package:gym_home/pages/bottom_bar.dart';
import 'package:gym_home/pages/shop.dart';
import 'package:gym_home/pages/tracking.dart';
import 'package:gym_home/pages/workouts.dart';

import '../components/slider.dart';

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
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Trending exercises',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              HomeSlider(
                items: [
                  Item(
                    name: 'Jumping Jacks',
                    image: 'assets/jumping-jacks.jpeg',
                    price: 0,
                  ),
                  Item(
                    name: 'Lying Legs Raise',
                    image: 'assets/lying-legs-raise.jpg',
                    price: 0,
                  ),
                  Item(
                    name: 'Push-ups',
                    image: 'assets/push-ups.jpg',
                    price: 0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Meals',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              HomeSlider(
                items: [
                  Item(
                    name: 'Jumping Jacks',
                    image: 'assets/jumping-jacks.jpeg',
                    price: 0,
                  ),
                  Item(
                    name: 'Jumping Jacks',
                    image: 'assets/jumping-jacks.jpeg',
                    price: 0,
                  ),
                  Item(
                    name: 'Jumping Jacks',
                    image: 'assets/jumping-jacks.jpeg',
                    price: 0,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  'Equipment for you',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              HomeSlider(
                items: [
                  Item(
                    name: 'Jumping Jacks',
                    image: 'assets/jumping-jacks.jpeg',
                    price: 0,
                  ),
                  Item(
                    name: 'Jumping Jacks',
                    image: 'assets/jumping-jacks.jpeg',
                    price: 0,
                  ),
                  Item(
                    name: 'Jumping Jacks',
                    image: 'assets/jumping-jacks.jpeg',
                    price: 0,
                  ),
                ],
              ),
            ],
          ),
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
