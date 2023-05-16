import 'package:flutter/material.dart';

import '../pages/shop.dart';

class HomeSlider extends StatefulWidget {
  final List<Item> items;

  const HomeSlider({
    super.key,
    required this.items,
  });

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Container(
                width: 200, // Adjust the width of each card
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.items[index].image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black.withOpacity(
                        0.3), // Add a transparent overlay for better readability
                  ),
                  child: Center(
                    child: Text(
                      widget.items[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                print(index);
              },
            ),
          );
        },
      ),
    );
  }
}
