import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'dart:async';

import 'package:hampter/testing_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
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
                Navigator.pushNamed(context, '/second');
              },
            ),
            const Text(
              'Hampter Points Gotten:',
            ),
            Text(
              '$_pointCounter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 300, // Specify a fixed height
              width: 300, // Optional: Match the parent's width
              child: const ModelViewer(
                src: 'assets/moo_deng.glb',
                iosSrc: 'frontend/assets/moo_deng.usdz',
                alt: 'moo deng :D',
                ar: false, // Disable AR
                autoRotate: true,
                cameraControls: true,
                disableZoom: true,
                loading: Loading.lazy,
              ),
            ),
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
