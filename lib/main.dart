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

  /// Future是异步的。借助async/await将异步转换为同步
  Future<CommonModel> fetchPost() async {
    // https://www.geekailab.com/io/flutter_app/json/test_common_model.json
    final httpUri = Uri(scheme: 'http', host: 'www.devio.org', path: 'io/flutter_app/json/test_common_model.json');
    final response = await http.get(httpUri);
    final result = json.decode(const Utf8Decoder().convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Future和FutureBuilder实用技巧'),
        ),
        body: FutureBuilder<CommonModel>(
          future: fetchPost(),
          builder: (context,snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Input a URL to start');
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator(),);
              case ConnectionState.active:
                return const Text('');
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('${snapshot.error}', style: const TextStyle(color: Colors.red),);
                } else {
                  return Column(children: [
                    Text('icon: ${snapshot.data?.icon}'),
                    Text('title: ${snapshot.data?.title}'),
                    Text('url: ${snapshot.data?.url}'),
                    Text('statusBarColor: ${snapshot.data?.statusBarColor}'),
                    Text('hideAppBar: ${snapshot.data?.hideAppBar}')
                  ],);
                }
            }
          },
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