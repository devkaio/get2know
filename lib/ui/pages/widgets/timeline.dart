// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

const completeColor = Color(0xFF593493);
const inProgressColor = Color(0xFF593493);
const todoColor = Color.fromARGB(255, 255, 255, 255);
ValueNotifier processIndex = ValueNotifier(0);

class MyTimeline extends StatelessWidget {
  final Axis? scrollDirection;
  final List<Map<String, dynamic>> list;
  const MyTimeline({
    Key? key,
    this.scrollDirection = Axis.horizontal,
    required this.list,
  }) : super(key: key);

  Color getColor(int index) {
    if (index == processIndex.value) {
      return inProgressColor;
    } else if (index < processIndex.value) {
      return completeColor;
    } else {
      return todoColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      scrollDirection: scrollDirection,
      physics: const NeverScrollableScrollPhysics(),
      builder: TimelineTileBuilder.connected(
        connectionDirection: ConnectionDirection.before,
        itemCount: list.length,
        itemExtentBuilder: (context, index) =>
            MediaQuery.of(context).size.width / list.length,
        oppositeContentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${list[index].values.first}',
            style: index == processIndex.value
                ? Theme.of(context).textTheme.headline4
                : Theme.of(context).textTheme.headline6,
          ),
        ),
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            child: Text(
              list[index].keys.first,
              textAlign: TextAlign.center,
              style: index == processIndex.value
                  ? Theme.of(context).textTheme.headline4?.copyWith(
                        color: completeColor,
                        fontWeight: FontWeight.bold,
                      )
                  : Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.grey.shade100),
            ),
          ),
        ),
        connectorBuilder: (context, index, type) {
          if (index > 0) {
            if (index == processIndex.value) {
              final prevColor = getColor(index - 1);
              final color = getColor(index);
              List<Color> gradientColors;
              if (type == ConnectorType.start) {
                gradientColors = [Color.lerp(prevColor, color, 0.5)!, color];
              } else {
                gradientColors = [
                  prevColor,
                  Color.lerp(prevColor, color, 0.5)!
                ];
              }
              return DecoratedLineConnector(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                  ),
                ),
              );
            } else {
              return SolidLineConnector(
                color: getColor(index),
              );
            }
          } else {
            return null;
          }
        },
        indicatorBuilder: (context, index) {
          Color? color;
          Widget? child;
          if (index == processIndex.value) {
            color = inProgressColor;
            child = child = const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            );
          } else if (index < processIndex.value) {
            color = completeColor;
            child = const Icon(
              Icons.check,
              color: Colors.white,
              size: 15.0,
            );
          } else {
            color = todoColor;
          }
          if (index <= processIndex.value) {
            return Stack(
              children: [
                CustomPaint(
                  size: const Size(30.0, 30.0),
                  painter: _BezierPainter(
                    color: color,
                    drawStart: index > 0,
                    drawEnd: index < processIndex.value,
                  ),
                ),
                DotIndicator(
                  size: 30.0,
                  color: color,
                  child: child,
                ),
              ],
            );
          } else {
            return Stack(
              children: [
                CustomPaint(
                  size: const Size(15.0, 15.0),
                  painter: _BezierPainter(
                    color: color,
                    drawEnd: index < list.length - 1,
                  ),
                ),
                OutlinedDotIndicator(
                  borderWidth: 4.0,
                  color: color,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class _BezierPainter extends CustomPainter {
  const _BezierPainter({
    required this.color,
    this.drawStart = true,
    this.drawEnd = true,
  });

  final Color color;
  final bool drawStart;
  final bool drawEnd;

  Offset _offset(double radius, double angle) {
    return Offset(
      radius * cos(angle) + radius,
      radius * sin(angle) + radius,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final radius = size.width / 2;

    double angle;
    Offset offset1;
    Offset offset2;

    Path path;

    if (drawStart) {
      angle = 3 * pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);
      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(0.0, size.height / 2, -radius, radius)
        ..quadraticBezierTo(0.0, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
    if (drawEnd) {
      angle = -pi / 4;
      offset1 = _offset(radius, angle);
      offset2 = _offset(radius, -angle);

      path = Path()
        ..moveTo(offset1.dx, offset1.dy)
        ..quadraticBezierTo(
            size.width, size.height / 2, size.width + radius, radius)
        ..quadraticBezierTo(size.width, size.height / 2, offset2.dx, offset2.dy)
        ..close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(_BezierPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.drawStart != drawStart ||
        oldDelegate.drawEnd != drawEnd;
  }
}
