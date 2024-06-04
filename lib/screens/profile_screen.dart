import 'package:app_project/screens/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.grey[600]),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alexis Pinzón',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'alexisbuenop@gmail.com',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Image.asset(
                'images/warrior.jpg',
                height: 150,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Mi Cuenta',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const ListOption(
                  icon: Icon(
                    Icons.person_2_outlined,
                    color: Colors.grey,
                  ),
                  title: 'Inicio'),
              const ListOption(
                  icon: Icon(
                    Icons.directions_outlined,
                    color: Colors.grey,
                  ),
                  title: 'Dirección'),
              const ListOption(
                  icon: Icon(
                    Icons.playlist_add_check_circle_rounded,
                    color: Colors.grey,
                  ),
                  title: 'Ordenes'),
              const ListOption(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.grey,
                  ),
                  title: 'Opciones'),
            ],
          ),
        )),
        showBottomNavbar: true,
        initialIndex: 3);
  }
}

class ListOption extends StatelessWidget {
  final Icon icon;
  final String title;
  const ListOption({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
      onTap: () {},
    );
  }
}
