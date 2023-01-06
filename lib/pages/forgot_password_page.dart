import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';
import 'package:todo_app/utils/email_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  Future passwordReset() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'RESET YOUR PASSWORD',
          style: TextStyle(
            fontFamily: 'San Francisco',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your email and we will send you a password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, fontFamily: 'San Francisco'),
            ),
          ),
          const SizedBox(height: 20.0),
          EmailFormField(
            controller: emailController,
            obscureText: false,
            labelText: 'Email Address',
            hintText: 'e.g example@gmail.com',
            maxLength: 50,
          ),
          const SizedBox(height: 20.0),
          MyButton(buttonName: 'Reset Password', onpressed: passwordReset),
        ],
      ),
    );
  }
}
