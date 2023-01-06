import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatefulWidget {
  final controller;
  bool obscureText;
  final String labelText;
  final String hintText;
  final int maxLength;

  EmailFormField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obscureText,
    required this.hintText,
    required this.maxLength,
  });

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      child: Container(
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formKey,
          child: TextFormField(
              maxLength: widget.maxLength,
              controller: widget.controller,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: widget.hintText,
                labelText: widget.labelText,
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              validator: (value) {
                if (value != null && !EmailValidator.validate(value)) {
                  return 'Enter a valid email';
                }
                return null;
              }),
        ),
      ),
    );
  }
}
