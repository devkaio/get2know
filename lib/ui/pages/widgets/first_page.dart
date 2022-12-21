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
          Padding(
            padding: const EdgeInsets.all(100.0),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= 1200.0) {
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1500.0),
                  child: Row(
                    children: const [
                      WhoAmIWidget(),
                      Spacer(),
                      SizedBox(width: 32.0),
                      ProfilePictureWidget(
                        size: Size(350.0, 350.0),
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  children: const [
                    ProfilePictureWidget(),
                    WhoAmIWidget(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ],
                );
              }
            }),
          ),
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
      borderRadius: BorderRadius.all(Radius.circular(size.width)),
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
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const WhoAmIWidget({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        FittedBox(
          child: Text(
            "Quem sou eu?",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.apply(color: Colors.white),
          ),
        ),
        Text(
          "Kaio Costa de Oliveira",
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.headline4?.apply(color: Colors.white),
        ),
        Text(
          "Flutter Developer",
          textAlign: TextAlign.center,
          style:
              Theme.of(context).textTheme.headline4?.apply(color: Colors.white),
        ),
        Text(
          "29 anos",
          style:
              Theme.of(context).textTheme.headline4?.apply(color: Colors.white),
        ),
        Text(
          "Casado",
          style:
              Theme.of(context).textTheme.headline4?.apply(color: Colors.white),
        ),
      ],
    );
  }
}
