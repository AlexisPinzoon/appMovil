import 'package:app_project/screens/custom_scaffold.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<String> imageUrls = [];
  List<String> titles = [
    'Camisetas',
    'Camisetas',
    'Camisetas',
    'Camisetas',
    'Camisetas',
  ];

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  Future<void> fetchImages() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    for (int i = 1; i <= 5; i++) {
      Reference ref = storage.ref().child('f$i.jpg');
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        imageUrls.add(downloadUrl);
      });
    }
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
                    const Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar camisetas, pantalones o accesorios',
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                      ),
                    )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.filter_alt)),
                  ],
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemCount: imageUrls.length,
              itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          imageUrls[index],
                        ),
                        fit: BoxFit.fitHeight),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            titles[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ))
          ],
        ),
      ),
      showBottomNavbar: true,
      initialIndex: 1,
    );
  }
}

class Products {
  final String image;
  final String title;
  final String subtitle;
  final String size;
  final double price;

  Products(
      {required this.image,
      required this.price,
      required this.size,
      required this.subtitle,
      required this.title});
}
