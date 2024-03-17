import 'package:flutter/material.dart';

import 'MyAppBar.dart';

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
    Text('Index 0: MyHomePage'),
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
      bottomNavigationBar: MyNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}

class MyNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const MyNavigationBar({super.key,
    required this.selectedIndex,
    required this.onDestinationSelected});

  final Color _iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: _iconColor),
          label: 'Home',
          selectedIcon: Icon(Icons.home, color: _iconColor),
        ),
        NavigationDestination(
          icon: Icon(Icons.bookmarks_outlined, color: _iconColor),
          label: 'My Books',
          selectedIcon: Icon(Icons.bookmarks, color: _iconColor),
        ),
        NavigationDestination(
          icon: Icon(const IconData(0xf037, fontFamily: 'MaterialIcons'),
              color: _iconColor),
          label: 'Home',
          selectedIcon: Icon(
            const IconData(
              0xe248,
              fontFamily: 'MaterialIcons',
            ),
            color: _iconColor,
          ),
        ),
        NavigationDestination(
          icon: Icon(Icons.search, color: _iconColor),
          label: 'Search',
          selectedIcon: Icon(Icons.search_outlined, color: _iconColor),
        ),
        NavigationDestination(
          icon: Icon(
            Icons.format_list_bulleted,
            color: _iconColor,
          ),
          label: 'More',
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      indicatorColor: Colors.transparent,
    );
  }
}