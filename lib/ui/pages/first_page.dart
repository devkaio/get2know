// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class FirstPage extends StatelessWidget {
  final PageController pageController;
  const FirstPage({
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
                        civilStatus: "Casado",
                        name: "Kaio Costa de Oliveira",
                        jobTitle: "Flutter Developer",
                        age: 29,
                        size: Size(
                          constraints.maxWidth,
                          constraints.maxHeight,
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(width: 32.0),
                      const ProfilePictureWidget(
                        networkImagePath:
                            'https://avatars.githubusercontent.com/u/3959419',
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
                    const ProfilePictureWidget(
                      networkImagePath:
                          'https://avatars.githubusercontent.com/u/3959419',
                    ),
                    WhoAmIWidget(
                      civilStatus: "Casado",
                      name: "Kaio Costa de Oliveira",
                      jobTitle: "Flutter Developer",
                      age: 29,
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
          NextPageButton(pageController: pageController),
        ],
      ),
    );
  }
}
