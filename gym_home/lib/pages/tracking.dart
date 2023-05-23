import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_charts/charts.dart';
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
  double _weight = 0;

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
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 350,
              child: SfCartesianChart(
                title: ChartTitle(text: 'Weight Tracking'),
                legend: Legend(isVisible: true),
                primaryXAxis: CategoryAxis(),

                series: <LineSeries<WeightData, String>>[
                  LineSeries<WeightData, String>(
                    name: 'Weight',
                    // Bind data source
                    dataSource:  <WeightData>[
                      WeightData('Jan', 50),
                      WeightData('Feb', 48),
                      WeightData('Mar', 52),
                      WeightData('Apr', 50),
                      WeightData('May', 55),
                      WeightData('Jun', _weight),
                    ],
                    // ignore: non_constant_identifier_names
                    xValueMapper: (WeightData Weight, _) => Weight.year,
                    // ignore: non_constant_identifier_names
                    yValueMapper: (WeightData Weight, _) => Weight.Weight
                  )
                ],
              ),
            ),
            AlertDialog(
              title: const Text('Weight for this month'),
              content: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Weight',
                ),
                onChanged: (value) {
                  setState(() {
                    _weight = double.parse(value);
                  });
                },
              ),
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

class WeightData {
  WeightData(this.year, this.Weight);
  final String year;
  // ignore: non_constant_identifier_names
  final double Weight;
}
