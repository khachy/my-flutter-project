import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  void Function() onSave;
  void Function() onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
        ),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            const SizedBox(height: 20.0),
            // buttons -> save and cancel
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  MyButton(
                    buttonName: 'Save',
                    onpressed: onSave,
                  ),
                  const SizedBox(width: 8.0),
                  // delete button
                  MyButton(
                    buttonName: 'Cancel',
                    onpressed: onCancel,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
