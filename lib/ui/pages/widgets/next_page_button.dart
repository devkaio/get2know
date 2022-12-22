import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 16.0,
      child: IconButton(
          onPressed: () => pageController.nextPage(
                duration: const Duration(milliseconds: 700),
                curve: Curves.ease,
              ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
            size: 56.0,
          )),
    );
  }
}
