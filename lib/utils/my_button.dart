import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;

  void Function() onpressed;
  MyButton({
    super.key,
    required this.buttonName,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      child: Text(buttonName),
    );
  }
}
