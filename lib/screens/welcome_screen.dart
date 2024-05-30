import 'package:app_project/screens/home_start_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  List<WelcomeSlider> welcomeSlider = [
    WelcomeSlider(
        title: 'Los mejores productos en la puerta de tu casa',
        image: 'images/carShopping.png'),
    WelcomeSlider(
        title: 'Compra hoy y recibe en menos de 3 días',
        image: 'images/shop.png'),
    WelcomeSlider(
        title: 'Calidad Garantizada', image: 'images/carShopping.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 68, 75, 87),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeStart()));
                    },
                    child: const Text(
                      "Saltar",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: welcomeSlider.length,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      itemBuilder: (context, index) {
                        final item = welcomeSlider[index];
                        return Column(
                          children: [
                            Image.asset(
                              item.image,
                              height: 350,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              item.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 18),
                            ),
                          ],
                        );
                      }),
                ),
                Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 10,
                        width: _currentPage == index ? 30 : 10,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            if (_currentPage < welcomeSlider.length - 1) {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            } else {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomeStart()));
            }
          },
          child: _currentPage != welcomeSlider.length - 1
              ? const Icon(Icons.arrow_forward)
              : const Icon(Icons.done),
        ),
      ),
    );
  }
}

class WelcomeSlider {
  final String title;
  final String image;
  WelcomeSlider({required this.title, required this.image});
}
