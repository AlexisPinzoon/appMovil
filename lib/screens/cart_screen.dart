import 'package:app_project/screens/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        body: SingleChildScrollView(), showBottomNavbar: true, initialIndex: 2);
  }
}
