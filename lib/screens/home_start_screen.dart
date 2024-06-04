import 'package:app_project/screens/custom_scaffold.dart';
import 'package:app_project/screens/productDetail.dart';
import 'package:flutter/material.dart';

class HomeStart extends StatefulWidget {
  const HomeStart({super.key});

  @override
  State<HomeStart> createState() => _HomeStartState();
}

class _HomeStartState extends State<HomeStart> {
  List<CardItem> cardItems = [];
  String searching = '';

  @override
  void initState() {
    super.initState();
    cardItems = [
      CardItem(
          title: 'Camisetas Oversize 1',
          images: 'images/shirt2pac.png',
          pricing: '\$100.000'),
      CardItem(
          title: 'Camisetas Oversize 2',
          images: 'images/shirtEazy.jpg',
          pricing: '\$100.000'),
      CardItem(
          title: 'Pantalon Cargo 1',
          images: 'images/pantalonesCargo.jpg',
          pricing: '\$200.000'),
      CardItem(
          title: 'Pantalon Cargo 2',
          images: 'images/pantalonesCargo2.jpg',
          pricing: '\$200.000'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Buscar camisetas, pantalones o accesorios',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searching = value;
                        });
                      },
                    )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.filter_alt)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: cardItems
                      .where((cardItem) => cardItem.title
                          .toUpperCase()
                          .contains(searching.toUpperCase()))
                      .map((cardItem) {
                    return buildCard(cardItem);
                  }).toList()),
            ),
          ],
        ),
      ),
      showBottomNavbar: true,
      initialIndex: 0,
    );
  }

  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductDetail()));
      },
      child: Card(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return Image.asset(
                  cardItem.images,
                  fit: BoxFit.fitHeight,
                );
              },
            ),
          ),
          ListTile(
              title: Text(
                cardItem.title,
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text(cardItem.pricing),
              trailing: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    'Premium',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
        ],
      )),
    );
  }
}

class CardItem {
  final String title;
  final String pricing;
  final String images;

  CardItem({required this.title, required this.images, required this.pricing});
}
