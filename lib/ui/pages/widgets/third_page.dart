import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_to_know_me_better_app/data/models/photo.dart';

class Third extends StatelessWidget {
  final PageController pageController;
  const Third({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Photo> photos = List.generate(
        13, (index) => Photo(path: 'assets/images/${index + 1}.jpeg'));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: CarouselSlider.builder(
              itemCount: photos.length,
              options: CarouselOptions(),
              itemBuilder: (context, index, realIndex) => Image.asset(
                photos[index].path,
              ),
            ),
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
