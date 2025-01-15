import 'package:flutter/material.dart';
import 'dark_mode_switch.dart';
import 'package:hampter/hamburger_menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  // pLEASE REFACTOR THESE NAMES DEAR GOD
  Widget build(BuildContext build) {
    return MySettingsPage(); // yep refacor
  }
}

class MySettingsPage extends StatefulWidget {
  const MySettingsPage({super.key});
  @override
  State<MySettingsPage> createState() => _MySettingsPageState();
}

class _MySettingsPageState extends State<MySettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamburgerMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Settings Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Bap Me!'),
              onPressed: () {
                Navigator.pop(context); // pages are like 'stacks'
              },
            ),
            DarkModeSwitch(),
          ],
        ),
      ),
    );
  }
}
