import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_to_know_me_better_app/data/models/photo.dart';

class Fifth extends StatelessWidget {
  final PageController pageController;
  const Fifth({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Photo> photos = List.generate(
        3, (index) => Photo(path: 'assets/places/${index + 1}.jpg'));
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
                    'assets/places${indexNotifier.value + 1}.jpg',
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
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: IconButton(
                onPressed: () => pageController.previousPage(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.ease,
                    ),
                icon: const Icon(
                  Icons.keyboard_arrow_up_rounded,
                  color: Color(0xFF593493),
                  size: 56.0,
                )),
          ),
        ],
      ),
    );
  }
}
