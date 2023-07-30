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
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView实现水平和垂直滚动的列表',),
        ),
        body: SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _buildList(),
          ),
        )
      ),
    );
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  // Widget _item(city) {
  //   return Container(
  //     height: 80,
  //     margin: const EdgeInsets.only(bottom: 5),
  //     alignment: Alignment.center,
  //     decoration: const BoxDecoration(color: Colors.teal),
  //     child: Text(city, style: const TextStyle(color: Colors.white, fontSize: 20),),
  //   );
  // }

  Widget _item(city) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Colors.teal),
      child: Text(city, style: const TextStyle(color: Colors.white, fontSize: 20),),
    );
  }
}