import 'package:app_project/screens/home_start_screen.dart';
import 'package:app_project/widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 110, 20, 110),
          child: Column(
            children: [
              const Text(
                'Crear Cuenta',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 40),
              TextFields(
                icon: const Icon(Icons.person_2_outlined),
                secureText: false,
                label: 'Nombre',
                controller: _nameController,
              ),
              const SizedBox(height: 40),
              TextFields(
                icon: const Icon(Icons.email_outlined),
                secureText: false,
                label: 'Correo Electrónico',
                controller: _emailController,
              ),
              const SizedBox(height: 40),
              TextFields(
                icon: const Icon(Icons.password_outlined),
                secureText: true,
                label: 'Contraseña',
                controller: _passwordController,
              ),
              const SizedBox(height: 40),
              TextFields(
                icon: const Icon(Icons.password_outlined),
                secureText: true,
                label: 'Confimar Contraseña',
                controller: _confirmPasswordController,
              ),
              const SizedBox(
                height: 10,
              ),
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
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeStart()));
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
      )),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Ya tienes una cuenta?',
              style: TextStyle(
                  fontFamily: 'SFUIDisplay', color: Colors.black, fontSize: 15),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              child: const Text(
                'Iniciar Sesión',
                style: TextStyle(
                    fontFamily: 'SFUIDisplay',
                    color: Colors.green,
                    fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  final Icon icon;
  final String label;
  TextEditingController controller;
  bool secureText;

  TextFields(
      {super.key,
      required this.icon,
      required this.controller,
      required this.label,
      required this.secureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: secureText,
        style: const TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          prefixIcon: icon,
          labelStyle: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
