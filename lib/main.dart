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
  List<String> cities = List.from(cityNames);
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _loadData() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      List<String> list = List.from(cities);
      list.addAll(cityNames);
      cities = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('列表下拉刷新和上拉加载更多',),
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            controller: _scrollController,
            children: _buildList(),
          ),
        )
      ),
    );
  }

  Future<void> _handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      cities = cities.reversed.toList();
    });
  }

  List<Widget> _buildList() {
    return cities.map((city) => _item(city)).toList();
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