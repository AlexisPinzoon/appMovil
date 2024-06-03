import 'package:app_project/screens/home_screen.dart';
import 'package:app_project/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() =>
      MyAppState(); // Cambiado de _MyAppState a MyAppState
}

class MyAppState extends State<MyApp> {
  // Cambiado de _MyAppState a MyAppState
  // Este widget es la raíz de tu aplicación.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Branch App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginScreen(),
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
        actions: const [
          Icon(Icons.search),
        ],
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
