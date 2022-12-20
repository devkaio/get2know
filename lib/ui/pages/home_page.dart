// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'widgets/first_page.dart';
import 'widgets/second_page.dart';
import 'widgets/third_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          First(pageController: pageController),
          Second(pageController: pageController),
          Third(pageController: pageController),
        ],
      ),
    );
  }
}
