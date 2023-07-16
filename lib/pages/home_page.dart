import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

import '../utils.dart';

const appBarScrollOffset = 100;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _imageUrls = [
    'https://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg',
    'https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg',
    'http://pages.ctrip.com/hotel/201811/jdsc_640es_tab1.jpg',
    'https://dimg03.c-ctrip.com/images/fd/tg/g1/M03/7E/19/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg',
  ];
  double appBarAlpha = 0;
  _onScroll(offset) {
    double alpha = offset / appBarScrollOffset;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    printDebug(appBarAlpha);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: NotificationListener(
                onNotification: (notification) {
                  // 未滚动也会收到Notification，且pixels非零，所以仅保留ScrollUpdateNotification
                  // 嵌套子View也监听，所以用`depth == 0`过滤掉非根View
                  if (notification is ScrollUpdateNotification && notification.depth == 0) {
                    _onScroll(notification.metrics.pixels);
                  }
                  return false;
                },
                child: ListView(
                  children: [
                    SizedBox(
                      height: 160,
                      child: Swiper(
                        itemCount: _imageUrls.length,
                        autoplay: true,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _imageUrls[index],
                            fit: BoxFit.fill,
                          );
                        },
                        pagination: const SwiperPagination(),
                      ),
                    ),
                    const SizedBox(
                      height: 800,
                      child: ListTile(
                        title: Text('哈哈'),
                      ),
                    ),
                  ],
                ),
              )
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(color: Colors.white,),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20,),
                  child: Text('首页'),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
