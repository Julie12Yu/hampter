import 'package:flutter/material.dart';
import 'dark_mode_switch.dart';
import 'package:hampter/hamburger_menu.dart';
import 'package:settings_ui/settings_ui.dart'; // Reason for no web compatability is because of settings_ui

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HamburgerMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Settings Page"),
      ),
      body: Center(
        child: SettingsList(
          sections: [
            SettingsSection(
              title: Text('Common'),
              tiles: <SettingsTile>[
                SettingsTile(
                  trailing: DarkModeSwitch(),
                  leading: Icon(Icons.dark_mode),
                  title: Text('Dark Mode'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
