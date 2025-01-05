import 'dart:async';
import 'package:flutter/material.dart';
import 'testing_display.dart';

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
  ThemeMode _themeMode = ThemeMode.system; // prefer system provided mode

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(), // allows dark mode - remove for light mode
      themeMode: _themeMode,
      home: const MyHomePage(),
    );
  }

  // call from 'context' with: MyApp.of(context).changeTheme(ThemeMode.dark);
  void changeMode(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode; // sets new theme mode
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class DarkModeSwitch extends StatefulWidget {
  const DarkModeSwitch({super.key});

  @override
  State<DarkModeSwitch> createState() => _DarkModeSwitchState();
}

class _DarkModeSwitchState extends State<DarkModeSwitch> {
  bool light = true;

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

class _MyHomePageState extends State<MyHomePage> {
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
        // Here we take the value from the MyHomePage object that was created by
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
            DarkModeSwitch(),
            const Text(
              'Hampter Points Gotten:',
            ),
            Text(
              '$_pointCounter',
              style: Theme.of(context).textTheme.headlineMedium,
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
