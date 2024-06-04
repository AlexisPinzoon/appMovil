import 'package:app_project/firebase_options.dart';
import 'package:app_project/screens/login_screen.dart';
import 'package:app_project/screens/provider.dart';
import 'package:app_project/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => CartProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() =>
      MyAppState(); // Cambiado de _MyAppState a MyAppState
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Branch App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const InitScreen(),
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
