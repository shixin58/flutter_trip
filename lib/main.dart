import 'package:flutter/material.dart';

const cityNames = ['北京', '上海', '广州', '深圳', '重庆', '武汉', '杭州', '西安', '郑州', '南京', '厦门', '大连'];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('网格布局',),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: _buildList(),
        )
      ),
    );
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 5,right: 5),
      decoration: const BoxDecoration(color: Colors.teal),
      alignment: Alignment.center,
      child: Text(city,style: const TextStyle(color: Colors.white,fontSize: 20),),
    );
  }
}