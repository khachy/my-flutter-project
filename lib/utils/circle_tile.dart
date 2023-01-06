import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String image;
  const SquareTile({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blueAccent),
        color: Colors.white,
      ),
      child: Image.asset(
        image,
        height: 40,
      ),
    );
  }
}
