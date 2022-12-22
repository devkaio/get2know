import 'package:flutter/material.dart';

class PreviewsPageButton extends StatelessWidget {
  const PreviewsPageButton({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
            color: Colors.white,
            size: 56.0,
          )),
    );
  }
}
