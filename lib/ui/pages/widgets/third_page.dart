import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  final PageController pageController;
  const Third({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color(0xFF593493)),
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
                color: Colors.white,
                size: 56.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
