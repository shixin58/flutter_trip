import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
