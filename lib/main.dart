import 'package:flutter/material.dart';

import 'MyNavigationBar.dart';
import 'MyAppBar.dart';
import 'Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goodreads',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(192, 188, 169, 100),
          primary: const Color.fromRGBO(192, 188, 169, 100),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: My Books',
    ),
    Text(
      'Index 2: Home',
    ),
    Text(
      'Index 3: Search',
    ),
    Text(
      'Index 4: More',
    ),
  ];

  int _selectedIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: _widgetOptions.elementAt(_selectedIndex),
      backgroundColor: const Color.fromRGBO(249, 248, 244, 15),
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}