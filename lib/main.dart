import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    // https://www.geekailab.com/io/flutter_app/json/test_common_model.json
    final httpUri = Uri(scheme: 'http', host: 'www.devio.org', path: 'io/flutter_app/json/test_common_model.json');
    final response = await http.get(httpUri);
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Http'),
        ),
        body: Column(
          children: [
            InkWell(
              onTap: () {
                fetchPost().then((CommonModel value) {
                  setState(() {
                    showResult = '请求结果: \nicon: ${value.icon}\ntitle: ${value.title}\nurl: ${value.url}\nstatusBarColor: ${value.statusBarColor}\nhideAppBar: ${value.hideAppBar}';
                  });
                });
              },
              child: const Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(showResult),
          ],
        ),
      ),
    );
  }
}

class CommonModel {
  final String? icon;
  final String? title;
  final String? url;
  final String? statusBarColor;
  final bool? hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});
  factory CommonModel.fromJson(Map<String,dynamic> map) {
    return CommonModel(
      icon: map['icon'],
      title: map['title'],
      url: map['url'],
      statusBarColor: map['statusBarColor'],
      hideAppBar: map['hideAppBar'],
    );
  }
}