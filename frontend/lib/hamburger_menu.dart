import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pop(
                  context); // needs to somehow work cuz rn it aint workin
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, '/second');

              /// nEEEDS TO BE CHANGED - DON'T WANT TO STACK PUSHES :(
            },
          ),
        ],
      ),
    );
  }
}
