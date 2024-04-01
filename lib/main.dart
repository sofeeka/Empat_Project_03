import 'package:flutter/material.dart';
import 'package:empat_project_03/themes/colors.dart';
import 'package:empat_project_03/bars/MyAppBar.dart';

import 'screens/home_screen.dart';
import 'screens/books_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> _widgetOptions = <Tab>[
    Tab(child: Home()),
    Tab(child: MyBooks()),
    Tab(child: Text('Index 2: Explore')),
    Tab(child: Text('Index 3: Search')),
    Tab(child: Text('Index 4: More'))
  ];

  static const double iconSize = 24;
  static const List<Icon> _tabIcons = <Icon>[
    Icon(Icons.home_outlined, color: iconColor, size: iconSize),
    Icon(Icons.bookmarks_outlined, color: iconColor, size: iconSize),
    Icon(IconData(0xf037, fontFamily: 'MaterialIcons'),
        color: iconColor, size: iconSize),
    Icon(IconData(0xe801, fontFamily: 'MyFlutterApp'),
        color: iconColor, size: iconSize),
    Icon(Icons.format_list_bulleted, color: iconColor, size: iconSize),
  ];

  static const List<Icon> _selectedTabIcons = <Icon>[
    Icon(Icons.home, color: iconColor, size: iconSize),
    Icon(Icons.bookmarks, color: iconColor, size: iconSize),
    Icon(IconData(0xe248, fontFamily: 'MaterialIcons'),
        color: iconColor, size: iconSize),
    Icon(IconData(0xe800, fontFamily: 'MyFlutterApp'),
        color: iconColor, size: iconSize),
    Icon(Icons.format_list_bulleted, color: iconColor, size: iconSize),
  ];

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _widgetOptions.length, vsync: this);
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  void _onTabIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
      _controller.animateTo(index);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Color FABColor = bookCardButtonColor[bookCardButtonColor.length - 1]; // last color - 5 star rating
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: const MyAppBar(),
      body: TabBarView(
        controller: _controller,
        children: _widgetOptions,
      ),
      backgroundColor: bottomNavigationBarColor,
      bottomNavigationBar: TabBar(
        controller: _controller,
        tabs: List.generate(
          _widgetOptions.length,
          (i) => Tab(
            child: (i == _selectedIndex ? _selectedTabIcons[i] : _tabIcons[i]),
          ),
        ),
        onTap: _onTabIndexChanged,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu')),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                _onTabIndexChanged(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My Books'),
              onTap: () {
                _onTabIndexChanged(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Explore'),
              onTap: () {
                _onTabIndexChanged(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Search'),
              onTap: () {
                _onTabIndexChanged(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('More'),
              onTap: () {
                _onTabIndexChanged(4);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        splashColor: Color.fromARGB(
          FABColor.alpha,
          FABColor.red - 40,
          FABColor.green - 40,
          FABColor.blue - 40,
        ),
        backgroundColor: FABColor,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
