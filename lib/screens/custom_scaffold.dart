import 'package:app_project/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool showBottomNavbar;
  final int initialIndex;
  const CustomScaffold(
      {super.key,
      required this.body,
      this.initialIndex = 0,
      this.showBottomNavbar = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar:
          showBottomNavbar ? BottomNavbar(initialIndex: initialIndex) : null,
    );
  }
}
