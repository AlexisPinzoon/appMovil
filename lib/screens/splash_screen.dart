import 'dart:async';

import 'package:app_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _homeState();
}

class _homeState extends State<InitScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animationController.forward();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeOut)),
              child: Image.asset(
                'images/logo.jpg',
                height: 250,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeOut)),
              child: const Text(
                'New Branch',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
            ),
            ScaleTransition(
              scale: Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeOut)),
              child: const Text(
                'Tienda de Ropa',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w100,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 40,
        child: Text(
          'Design by Alexis Pinzón',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
