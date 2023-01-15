import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/utils/my_button.dart';
import 'package:todo_app/utils/email_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // get current user
  final user = FirebaseAuth.instance.currentUser;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Fluttertoast.showToast(
        msg: 'Password reset link sent! Check your email',
        fontSize: 18.0,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.blueAccent,
      );

      // IF USER WANTS TO RE-AUTHENTICATE, i.e if user has forgotten password
      await user?.reauthenticateWithCredential(EmailAuthProvider.credential(
          email: emailController.text, password: passwordController.text));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(
        msg: error.message.toString(),
        fontSize: 18.0,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.blueAccent,
      );
    }
  }

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
