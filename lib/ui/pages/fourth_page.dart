import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_to_know_me_better_app/data/models/photo.dart';

import 'widgets/widgets.dart';

class FourthPage extends StatelessWidget {
  final PageController pageController;
  const FourthPage({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Photo> photos = List.generate(
        20, (index) => Photo(path: 'assets/tv_show/${index + 1}.jpg'));
    final indexNotifier = ValueNotifier(0);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBuilder(
            animation: indexNotifier,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/tv_show/${indexNotifier.value + 1}.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
                  child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0))),
                ),
              );
            },
          ),
          CarouselSlider.builder(
            itemCount: photos.length,
            options: CarouselOptions(
              aspectRatio: 2 / 3,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) => indexNotifier.value = index,
            ),
            itemBuilder: (context, index, realIndex) {
              return Image.asset(
                photos[index].path,
                fit: BoxFit.fitHeight,
              );
            },
          ),
          PreviewsPageButton(pageController: pageController),
          NextPageButton(pageController: pageController),
        ],
      ),
    );
  }
}
