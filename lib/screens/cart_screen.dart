import 'package:app_project/screens/custom_scaffold.dart';
import 'package:app_project/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void incrementQuantity(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      quantities[index]--;
    });
  }

  double getCartToal() {
    double total = 0.0;
    for (int i = 0; i < productNames.length; i++) {
      total += quantities[i] * prices[i];
    }

    return total;
  }

  void showCheck() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Correcto'),
          content: const Text('Productos comprados correctamente!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('CORRECTO'),
            ),
          ],
        );
      },
    );
  }

  List<int> quantities = [1, 1, 1, 1, 1];
  List<double> prices = [100.000, 80.000, 70.000, 85.000, 90.000];
  List<String> images = [
    'images/f1.jpg',
    'images/f2.jpg',
    'images/f3.jpg',
    'images/f4.jpg',
    'images/f5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    List<CartItem> cartItems = Provider.of<CartProvider>(context).cartItems;
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
                        itemCount: cartItems.length,
                        itemBuilder: ((context, index) {
                          CartItem item = cartItems[index];
                          return Dismissible(
                            key: Key(productNames[index]),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                productNames.removeAt(index);
                              });
                            },
                            background: Container(
                              color: Colors.red,
                              child:
                                  const Icon(Icons.cancel, color: Colors.white),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16.0),
                            ),
                            child: Container(
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
                                        item.name,
                                        //productNames[index],
                                        style: const TextStyle(fontSize: 18.0),
                                      ),
                                      Text(
                                        '\$${item.price}',
                                        //'\$${prices[index].toStringAsFixed(3)}',
                                        style: const TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          decrementQuantity(index);
                                        },
                                        icon: const Icon(Icons.remove),
                                      ),
                                      Text(
                                        quantities[index].toString(),
                                        style: const TextStyle(fontSize: 18.0),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          incrementQuantity(index);
                                        },
                                        icon: const Icon(Icons.add),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }))),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Text(
                        'Total: ',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        '\$${getCartToal().toStringAsFixed(3)}',
                        style: const TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            showCheck();
                          },
                          child: const Text('Ir a pagar'),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        showBottomNavbar: true,
        initialIndex: 2);
  }
}
