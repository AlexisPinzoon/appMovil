import 'package:app_project/screens/home_start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Acceder',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Inicie sesión para continuar',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: _emailController,
              style: const TextStyle(
                  color: Colors.black, fontFamily: 'SFUIDisplay'),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Correo Electrónico',
                  prefixIcon: Icon(Icons.email),
                  labelStyle: TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(
                  color: Colors.black, fontFamily: 'SFUIDisplay'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Contraseña',
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Mostrar',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  labelStyle: const TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text)
                          .then((value) => {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeStart()))
                              });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Acceder',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24.0,
                        )
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No tienes una cuenta?',
              style: TextStyle(
                  fontFamily: 'SFUIDisplay', color: Colors.black, fontSize: 15),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                      fontFamily: 'SFUIDisplay',
                      color: Colors.green,
                      fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }
}
