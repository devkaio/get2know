import 'package:flutter/material.dart';

class ProfilePictureWidget extends StatelessWidget {
  final String networkImagePath;
  final Size size;
  const ProfilePictureWidget({
    Key? key,
    this.size = const Size(250.0, 250.0),
    required this.networkImagePath,
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
        networkImagePath,
        fit: BoxFit.cover,
        height: size.height,
        width: size.width,
      ),
    );
  }
}
