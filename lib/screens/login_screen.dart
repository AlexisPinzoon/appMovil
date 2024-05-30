import 'package:app_project/widgets/sign_in.dart';
import 'package:app_project/widgets/sign_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/estoico.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7), BlendMode.darken)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 120, 5, 20),
                ),
                Image.asset(
                  'images/logo.jpg',
                  height: 175,
                ),
                SizedBox(height: 100),
                Button(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  text: 'Registrarse',
                ),
                SizedBox(height: 45),
                Button(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  text: 'Iniciar Sesión',
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7, right: 10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: const Text(
                        'Saltar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Button extends StatelessWidget {
  String text;
  final void Function() onPressed;

  Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}
