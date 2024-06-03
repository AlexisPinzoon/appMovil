import 'package:app_project/widgets/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _SignUpState();
}

class _SignUpState extends State<Forgetpassword> {
  final TextEditingController _emailController = TextEditingController();

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
                'Olvidaste la contraseña?',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 40),
              TextFields(
                icon: const Icon(Icons.email_outlined),
                secureText: false,
                label: 'Correo Electrónico',
                controller: _emailController,
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
                            .sendPasswordResetEmail(
                              email: _emailController.text,
                            )
                            .then((value) => {
                                  Navigator.of(context).pop(),
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
      )),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Recordaste tu contraseña?',
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
