import 'package:flutter/material.dart';
import 'dart:async';

import 'package:hampter/pages/components/testing_display.dart';
import 'package:hampter/pages/components/hamburger_menu.dart';
import 'package:hampter/pages/components/view_hampter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pointCounter = 0;
  int _hampCount = 0;
  String _title = "0 points, 0 hampters";
  Timer? _timer;

  void _incrementCounter() {
    setState(() {
      _pointCounter++;
      findTitle();
    });
  }

  void _clearAll() {
    setState(() {
      _pointCounter = 0;
      _hampCount = 0;
      findTitle();
    });
  }

  void startCounter() {
    if (_hampCount > 0 && _pointCounter > 0) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        // Add points based on the number of hampsters
        setState(() {
          _pointCounter += _hampCount;
          findTitle();
        });
      });
    }
  }

  void _incrementHampter() {
    setState(() {
      _hampCount++;
      findTitle();
    });
    startCounter();
  }

  void findTitle() {
    _title = "$_pointCounter points, $_hampCount hampters";
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: HamburgerMenu(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the HomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(_title),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Tap Me!'),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
            const Text(
              'Hampter Points Gotten:',
            ),
            Text(
              '$_pointCounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const ViewHampter(),
          ],
        ),
      ),
      floatingActionButton: TestingDisplay(
        onIncrement: _incrementCounter,
        onIncrementHampter: _incrementHampter,
        onClearAll: _clearAll,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
