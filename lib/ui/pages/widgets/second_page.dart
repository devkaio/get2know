import 'package:flutter/material.dart';

import 'timeline.dart';

class Second extends StatelessWidget {
  final PageController pageController;
  const Second({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jobList = [
      {'JUCEA': 2011},
      {'Sidecon': 2013},
      {'CEO de MEI': 2015},
      {'UNIFAEL': 2018},
      {'Raro Academy': 2021},
      {'Raro Labs': 2021},
      {'Proz': 2022},
    ];

    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
          constraints: constraints,
          child: Stack(
            children: [
              Container(color: Colors.orange),
              AnimatedBuilder(
                animation: processIndex,
                builder: (context, state) {
                  if (constraints.maxWidth <= 960) {
                    return ConstrainedBox(
                      constraints: constraints,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 64.0),
                        child: MyTimeline(
                          scrollDirection: Axis.vertical,
                          list: jobList,
                        ),
                      ),
                    );
                  } else {
                    return ConstrainedBox(
                      constraints: constraints,
                      child: MyTimeline(
                        scrollDirection: Axis.horizontal,
                        list: jobList,
                      ),
                    );
                  }
                },
              ),
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
                    )),
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
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          processIndex.value = (processIndex.value + 1) % jobList.length;
        },
        backgroundColor: inProgressColor,
        child: const Icon(Icons.navigate_next_rounded),
      ),
    );
  }
}
