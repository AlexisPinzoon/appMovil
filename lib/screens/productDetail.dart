import 'package:app_project/screens/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _currentSlide = 0;
  int selectedButton = 2;

  void addToCart() {
    CartItem newItem = CartItem(name: 'Camiseta', price: 80.000, quantity: 1);
    Provider.of<CartProvider>(context, listen: false).addToCart(newItem);
  }

  void selectButton(int buttonIndex) {
    setState(() {
      selectedButton = buttonIndex;
    });
  }

  final List<String> _image = ['images/shirt2pac.png', 'images/shirtEazy.jpg'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentSlide = index;
                    });
                  }),
              items: _image.map((image) {
                return Builder(builder: (context) {
                  return Image.asset(
                    image,
                    fit: BoxFit.cover,
                  );
                });
              }).toList(),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text('Camisetas',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text(
                        'Precio: \$100.000',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Descripción',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Camiseta Oversize 100% algodón 2Pac',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Camiseta Oversize 100% algodón Eazy E',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: Container(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      selectButton(1);
                      addToCart();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            selectedButton == 1 ? Colors.grey : Colors.white),
                    child: Text(
                      'Agregar al carrito',
                      style: TextStyle(
                          color:
                              selectedButton == 1 ? Colors.white : Colors.black,
                          fontSize: 16),
                    ),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
