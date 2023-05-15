import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key, 
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withOpacity(.60),
      type: BottomNavigationBarType.shifting,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.orange,
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.orange,
          icon: Icon(Icons.bar_chart),
          label: "Tracking",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.orange,
          icon: Icon(Icons.fitness_center),
          label: "Workouts",
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.orange,
          icon: Icon(Icons.shopping_cart),
          label: "Shop",
        ),
      ],
    );
  }
}
