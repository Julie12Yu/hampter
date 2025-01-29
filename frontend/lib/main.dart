import 'package:flutter/material.dart';
import 'package:hampter/home_page.dart';
import 'package:hampter/treat_shop_page.dart';
import 'settings/settings_page.dart';
import 'package:hampter/trinket_shop_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // default is stateless - stateful to accept _MyAppState
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<
          _MyAppState>()!; // of() allows for child widgets to access
}

class _MyAppState extends State<MyApp> {
  ThemeMode _appThemeMode = ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _appThemeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
        '/trinket_shop': (context) => const TrinketShopPage(),
        '/treat_shop': (context) => const TreatShopPage(),
      },
    );
  }

  // call from 'context' with: MyApp.of(context).changeMode(ThemeMode.dark);
  void changeMode(ThemeMode themeMode) {
    setState(() {
      _appThemeMode = themeMode; // sets new theme mode
    });
  }

  bool getMode() {
    // our switch is "true" if the 'dark mode' switch is on.
    return _appThemeMode == ThemeMode.dark;
  }
}
