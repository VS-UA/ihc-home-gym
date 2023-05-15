import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EquipmentDataPage extends StatefulWidget {
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const EquipmentDataPage({
    super.key,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  // ignore: library_private_types_in_public_api
  _EquipmentDataPageState createState() => _EquipmentDataPageState();
}

class Item {
  final String name;
  final String image;
  final double price;

  const Item({required this.name, required this.image, required this.price});
}

class _EquipmentDataPageState extends State<EquipmentDataPage>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool checkboxValue1 = false;
  bool checkboxValue2 = false;
  bool checkboxValue3 = false;
  bool checkboxValue4 = false;

  int _counter = 0;

  final List<Item> _items = [
    const Item(
      name: 'Dumbbells',
      image:
          'https://cdn.shopify.com/s/files/1/0272/9056/6756/products/MG_1713_128f6166-cfa2-42c9-8f75-565397e129f9_1200x.jpg?v=1599157174',
      price: 90.99,
    ),
    const Item(
      name: 'Treadmill',
      image:
          'https://cdn.shopify.com/s/files/1/0052/7043/7978/products/sunny-health-fitness-treadmills-electric-treadmill-SF-T7603-01_750x.jpg?v=1605225037',
      price: 599.99,
    ),
    const Item(
      name: 'Bench',
      image:
          'https://sc02.alicdn.com/kf/HTB1mMsXRAPoK1RjSZKbq6x1IXXao/234515477/HTB1mMsXRAPoK1RjSZKbq6x1IXXao.jpg',
      price: 299.99,
    ),
    const Item(
      name: 'Fixed Bar',
      image:
          'https://cdn.shopify.com/s/files/1/0027/5716/5119/products/1868.jpg?v=1621943651',
      price: 35.99,
    ),
  ];

  List<Item> _cartItems = [];

  double get _totalPrice => _cartItems.fold(0, (sum, item) => sum + item.price);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Shopping',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              )),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return ListTile(
                  leading: Image.network(
                    item.image,
                    height: 60,
                    width: 60,
                  ),
                  title: Text(item.name),
                  trailing: Text('\$${item.price}'),
                  onTap: () {
                    setState(() {
                      _cartItems.add(item);
                      _incrementCounter();
                    });
                  },
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Total'),
            trailing: Text(
                '($_counter) itens      \$${_totalPrice.toStringAsFixed(2)}'),
          ),
          Container(
            height: 75,
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Shopping Cart'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: _cartItems
                          .map(
                            (item) => ListTile(
                              leading: Image.network(
                                item.image,
                                height: 40,
                                width: 40,
                              ),
                              title: Text(item.name),
                              trailing: Text('\$${item.price}'),
                            ),
                          )
                          .toList(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _cartItems.clear();
                            _counter = 0;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                            'CONFIRM'), // apertar este botao leva ao menu do app
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                'ADD PRODUCTS TO SHOPPING CART',
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Tracking",
          ),
        ],
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.black,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
