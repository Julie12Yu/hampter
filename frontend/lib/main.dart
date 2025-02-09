import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hampter/pages/home_page.dart';
import 'package:hampter/pages/treat_shop_page.dart';
import 'pages/settings_page.dart';
import 'package:hampter/pages/trinket_shop_page.dart';
import 'graphql_client.dart';

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

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: GraphQLService.httpLink,
      cache: GraphQLCache(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: MaterialApp(
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
        ));
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
