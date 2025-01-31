import 'package:flutter/material.dart';
import 'components/hamburger_menu.dart';

class TrinketShopPage extends StatefulWidget {
  const TrinketShopPage({super.key});

  @override
  State<TrinketShopPage> createState() => _TrinketShopPageState();
}

class _TrinketShopPageState extends State<TrinketShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HamburgerMenu(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Trinket Shop"),
        ),
        body: Center(child: Text("this is a trinket shop!")));
  }
}
