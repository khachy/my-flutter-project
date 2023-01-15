import 'package:flutter/material.dart';
import 'dart:math';

class Loader extends StatefulWidget {
  final String text;
  const Loader({
    super.key,
    required this.text,
  });

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  final initialRadius = 15.0;
  double radius = 0.0;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation_rotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));
    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animation_radius_out = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    animationController.addListener(() {
      setState(() {
        if (animationController.value >= 0.75 &&
            animationController.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (animationController.value >= 0.0 &&
            animationController.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });
    animationController.repeat();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              child: Center(
                child: RotationTransition(
                  turns: animation_rotation,
                  child: Stack(
                    children: [
                      Dot(
                        radius: 15.0,
                        color: Colors.black12,
                      ),
                      Transform.translate(
                        offset:
                            Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.redAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.blue,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.purple,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      Transform.translate(
                        offset: Offset(
                            radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                        child: Dot(
                          radius: 5.0,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(
                  fontFamily: 'San Francisco',
                  fontSize: 10.0,
                  color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  const Dot({
    super.key,
    required this.radius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
