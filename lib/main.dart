import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Future和FutureBuilder实用技巧'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment Counter'),
            ),
            ElevatedButton(
              onPressed: _getCounter,
              child: const Text('Get Counter'),
            ),
            Text(
              countString,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              localCount,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        )
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = '$countString 1';
    });
    int counter = (prefs.getInt('counter')??0) + 1;
    await prefs.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = (prefs.getInt('counter')??0).toString();
    });
  }
}