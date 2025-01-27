import 'package:flutter/material.dart';
import '../main.dart';

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  late bool light;

  @override
  void initState() {
    super.initState();
    light = MyApp.of(context).getMode();
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.deepPurpleAccent,
      onChanged: (bool value) {
        setState(() {
          // called when the user toggles the switch.
          if (value) {
            // if switch is on, we're on dark mode
            MyApp.of(context).changeMode(ThemeMode.dark);
          } else {
            MyApp.of(context).changeMode(ThemeMode.light);
          }
          light = value; // ensure state is up to date
        });
      },
    );
  }
}
