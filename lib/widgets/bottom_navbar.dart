import 'package:app_project/screens/cart_screen.dart';
import 'package:app_project/screens/home_start_screen.dart';
import 'package:app_project/screens/products_screen.dart';
import 'package:app_project/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  final int initialIndex;
  const BottomNavbar({super.key, required this.initialIndex});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        _navigateToRoute(context, '/home', const HomeStart());
        break;
      case 1:
        _navigateToRoute(context, '/products', const ProductsScreen());
        break;
      case 2:
        _navigateToRoute(context, '/cart', const CartScreen());
        break;
      case 3:
        _navigateToRoute(context, '/profile', const ProfileScreen());
        break;
    }
  }

  void _navigateToRoute(BuildContext context, String routeName, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;

    if (routeExists) {
      Navigator.popUntil(context, ModalRoute.withName(routeName));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => screen,
              settings: RouteSettings(name: routeName)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.black,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: _selectedIndex == 0
                ? const Color.fromARGB(255, 53, 109, 48)
                : Colors.black,
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_outlined,
            color: _selectedIndex == 1
                ? const Color.fromARGB(255, 53, 109, 48)
                : Colors.black,
          ),
          label: 'Productos',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.shopping_bag,
            color: _selectedIndex == 2
                ? const Color.fromARGB(255, 53, 109, 48)
                : Colors.black,
          ),
          label: 'Compras',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: _selectedIndex == 3
                ? const Color.fromARGB(255, 53, 109, 48)
                : Colors.black,
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}
