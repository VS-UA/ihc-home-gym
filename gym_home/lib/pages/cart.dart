import 'package:flutter/material.dart';
import 'package:gym_home/pages/home.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        //title: const Text("Cart"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Shopping List",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(children: [
              Image.asset('assets/fixed_bar.png',
                width: 200,
                height: 300,
              ),
              
              const Text("    Fixed bar"),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.add), 
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
              ),
              Text(
                _counter.toString()
              ),
              IconButton(
                icon: const Icon(Icons.remove), 
                onPressed: () {
                  setState(() {
                    if (_counter > 0) {
                      _counter--;
                    }
                  });
                },
              ),    
            ],
          ),
          const SizedBox(
            height: 250,
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'Remove all'
                ), // apertar este botao leva ao menu do app
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text(
                  'Confirm purchase'
                ), // apertar este botao leva ao menu do app
              ),
            ],
          ),
        ],
      ),
    );
  }
}