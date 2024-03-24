import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:empat_project_03/Colors.dart';

import 'MyAppBar.dart';
import 'Home.dart';

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
    Tab(child: Text('Index 1: My Books')),
    Tab(child: Text('Index 2: Home')),
    Tab(child: Text('Index 3: Search')),
    Tab(child: Text('Index 4: More'))
  ];
  static const _kFontFam = 'MyFlutterApp';

  static const double iconSize = 24;
  static const List<Icon> _tabIcons = <Icon>[
    Icon(Icons.home_outlined, color: iconColor, size: iconSize),
    Icon(Icons.bookmarks_outlined, color: iconColor, size: iconSize),
    Icon(IconData(0xf037, fontFamily: 'MaterialIcons'), color: iconColor, size: iconSize),
    Icon(IconData(0xe801, fontFamily: _kFontFam), color: iconColor, size: iconSize),
    Icon(Icons.format_list_bulleted, color: iconColor, size: iconSize),
  ];

  static const List<Icon> _selectedTabIcons = <Icon>[
    Icon(Icons.home, color: iconColor, size: iconSize),
    Icon(Icons.bookmarks, color: iconColor, size: iconSize),
    Icon(IconData(0xe248, fontFamily: 'MaterialIcons'), color: iconColor, size: iconSize),
    Icon(IconData(0xe800, fontFamily: _kFontFam), color: iconColor, size: iconSize),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child:
                  (i == _selectedIndex ? _selectedTabIcons[i] : _tabIcons[i])),
        ),
        onTap: _onTabIndexChanged,
      ),
    );
  }
}
