import 'package:flutter/material.dart';
import 'dart:math';

class Loader extends StatefulWidget {
  const Loader({super.key});

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.0,
        height: 100.0,
        child: Center(
          child: Stack(
            children: [
              Dot(
                radius: 30.0,
                color: Colors.black12,
              ),
            ],
          ),
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
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
