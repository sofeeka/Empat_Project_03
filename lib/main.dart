import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(192, 188, 169, 100),
          title: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Material(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Title, author or ISBN',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  enabled: false,
                ),
              ),
            ),
          ),
          actions: const [
            Icon(Icons.notifications_outlined),
            SizedBox(
              width: 10,
            )
          ],
      ),
    );
  }
}
