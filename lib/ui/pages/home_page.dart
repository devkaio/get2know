// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'fifth_page.dart';
import 'first_page.dart';
import 'fourth_page.dart';
import 'second_page.dart';
import 'third_page.dart';

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
          FirstPage(pageController: pageController),
          SecondPage(pageController: pageController),
          ThirdPage(pageController: pageController),
          FourthPage(pageController: pageController),
          FifthPage(pageController: pageController),
        ],
      ),
    );
  }
}
