import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pop(context); // closes the drawer
              // if not already in home page
              if (ModalRoute.of(context)?.settings.name != '/') {
                Navigator.pushReplacementNamed(context, '/');
              }
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context); // closes the drawer
              // if not already in settings page
              if (ModalRoute.of(context)?.settings.name != '/settings') {
                Navigator.pushReplacementNamed(context, '/settings');
              }
            },
          ),
          ListTile(
            title: const Text('Shop'),
            onTap: () {
              Navigator.pop(context); // closes the drawer
              // if not already in settings page
              if (ModalRoute.of(context)?.settings.name != '/shop') {
                Navigator.pushReplacementNamed(context, '/shop');
              }
            },
          ),
        ],
      ),
    );
  }
}
