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
      elevation: 0.0,
      padding: const EdgeInsets.all(12.0),
      onPressed: onpressed,
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      child: Text(
        buttonName,
        style: TextStyle(fontFamily: 'San Francisco', fontSize: 16.0),
      ),
    );
  }
}
