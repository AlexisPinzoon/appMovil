import 'package:app_project/screens/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
        body: SingleChildScrollView(), showBottomNavbar: true, initialIndex: 3);
  }
}
