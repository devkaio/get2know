// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class First extends StatelessWidget {
  final PageController pageController;
  const First({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF593493),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth >= 1400.0) {
              return ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1500.0),
                child: Padding(
                  padding: const EdgeInsets.all(100.0),
                  child: Row(
                    children: [
                      WhoAmIWidget(
                        size: Size(
                          constraints.maxWidth,
                          constraints.maxHeight,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 32.0),
                      const ProfilePictureWidget(
                        size: Size(350.0, 350.0),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfilePictureWidget(),
                    WhoAmIWidget(
                      size: Size(
                        constraints.maxWidth,
                        constraints.maxHeight,
                      ),
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ],
                ),
              );
            }
          }),
          Positioned(
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
          ),
        ],
      ),
    );
  }
}

class ProfilePictureWidget extends StatelessWidget {
  final Size size;
  const ProfilePictureWidget({
    Key? key,
    this.size = const Size(250.0, 250.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(
          size.width / 2,
        ),
      ),
      child: Image.network(
        'https://avatars.githubusercontent.com/u/3959419',
        fit: BoxFit.cover,
        height: size.height,
        width: size.width,
      ),
    );
  }
}

class WhoAmIWidget extends StatelessWidget {
  final Size size;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const WhoAmIWidget({
    Key? key,
    this.size = Size.zero,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  double get titleFontSize {
    if (size.width < 480) {
      return 36.0;
    } else if (size.width < 640) {
      return 64.0;
    } else if (size.width < 1400) {
      return 84.0;
    } else {
      return 112.0;
    }
  }

  double get subtitleFontSize {
    if (size.width < 480) {
      return 24.0;
    } else if (size.width < 640) {
      return 36.0;
    } else if (size.width < 1400) {
      return 48.0;
    } else {
      return 64.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          "Quem sou eu?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFontSize,
          ),
        ),
        Text(
          "Kaio Costa de Oliveira",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
        Text(
          "Flutter Developer",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
        Text(
          "29 anos",
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
        Text(
          "Casado",
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
      ],
    );
  }
}
