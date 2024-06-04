import 'package:app_project/screens/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> productNames = [
    'Camiseta 1',
    'Camiseta 2',
    'Camiseta 3',
    'Camiseta 4',
    'Camiseta 5'
  ];

  List<int> quantities = [1, 1, 1, 1, 1];
  List<double> prices = [100.0, 80.0, 70.0, 85.0, 90.0];
  List<String> images = [
    'images/f1.jpg',
    'images/f2.jpg',
    'images/f3.jpg',
    'images/f4.jpg',
    'images/f5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                const Text(
                  'Carrito de compras',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: productNames.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10.0),
                            padding: const EdgeInsets.only(right: 16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  images[index],
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      productNames[index],
                                      style: const TextStyle(fontSize: 18.0),
                                    ),
                                    Text(
                                      '\$${prices[index]}',
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove),
                                    ),
                                    const Text(
                                      '1',
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        })))
              ],
            ),
          ),
        ),
        showBottomNavbar: true,
        initialIndex: 2);
  }
}
