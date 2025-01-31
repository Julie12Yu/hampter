import 'package:flutter/material.dart';
import 'components/hamburger_menu.dart';

class TreatShopPage extends StatefulWidget {
  const TreatShopPage({super.key});

  @override
  State<TreatShopPage> createState() => _TreatShopPageState();
}

class _TreatShopPageState extends State<TreatShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: HamburgerMenu(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Treat Shop"),
        ),
        body: Center(child: Text("this is a treat shop!")));
  }
}
