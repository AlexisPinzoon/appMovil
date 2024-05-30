import 'package:app_project/screens/home_screen.dart';
import 'package:app_project/screens/login_screen.dart';
import 'package:app_project/screens/welcome_screen.dart';
import 'package:app_project/widgets/video_card.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Branch App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estoicismo"),
        backgroundColor: Colors.grey,
        actions: [
          const Icon(Icons.search),
        ],
      ),
      body: Column(
        children: [
          VideoCard(),
        ],
      ),
    );
  }
}
