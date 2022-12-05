import 'package:flutter/material.dart';
import 'package:newsapp/constants.dart';
import 'dart:math' as math;

import 'package:newsapp/model/zambales_news.dart';
import 'package:newsapp/screens/home/components_in_zambales/zambales_news_card.dart';

class ZambalesNewsCarousel extends StatefulWidget {
  const ZambalesNewsCarousel({Key? key}) : super(key: key);

  @override
  State<ZambalesNewsCarousel> createState() => _ZambalesNewsCarouselState();
}

class _ZambalesNewsCarouselState extends State<ZambalesNewsCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(

      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value){
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: zambalesnews.length,
          itemBuilder: (context,index) => buildNewsSlider(index),
        ),
      ),
    );
  }
  Widget buildNewsSlider(int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child){
      double value = 0;
      if (_pageController.position.haveDimensions){
        value = index - _pageController.page!;
        value = (value * 0.038).clamp(-1, 1);
      }
      return AnimatedOpacity(
        duration: Duration(milliseconds: 350),
        opacity: initialPage == index ? 1: 0.4,
        child: Transform.rotate(
          angle: math.pi * value,
          child: ZambalesNewsCard(zambalesnewsmodel: zambalesnews[index]),
        ),
      );
    },
  );
}