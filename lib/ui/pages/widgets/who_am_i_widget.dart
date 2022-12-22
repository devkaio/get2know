import 'package:flutter/material.dart';

class WhoAmIWidget extends StatelessWidget {
  final Size size;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String titleText;
  final String name;
  final String jobTitle;
  final int age;
  final String civilStatus;

  const WhoAmIWidget({
    Key? key,
    this.size = Size.zero,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.titleText = "Quem sou eu?",
    required this.name,
    required this.jobTitle,
    required this.age,
    this.civilStatus = "Solteiro",
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
          titleText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: titleFontSize,
          ),
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
        Text(
          jobTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
        Text(
          age.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
        Text(
          civilStatus,
          style: TextStyle(
            color: Colors.white,
            fontSize: subtitleFontSize,
          ),
        ),
      ],
    );
  }
}
