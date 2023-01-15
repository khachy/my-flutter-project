import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/pages/forgot_password_page.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/verification_page.dart';
import 'package:todo_app/utils/login_or_signup_button.dart';
import 'package:todo_app/utils/email_textfield.dart';
import 'package:todo_app/utils/circle_tile.dart';
import 'package:todo_app/utils/password_textfield.dart';

import '../utils/loader.dart';

class RegisterPage extends StatefulWidget {
  void Function()? onTap;
  RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  bool isClicked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // sign up method
  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Loader(text: 'PLEASE WAIT...');
      },
    );
    try {
      // check if passwords are the same
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        // show error message, passwords don't match
        Fluttertoast.showToast(msg: 'Passwords don\'t match', 
        fontSize: 18,
         backgroundColor: Colors.blueAccent, 
         textColor: Colors.white,
         );
      }
      Navigator.pop(context);

      // validate the form
      formKey.currentState?.validate();
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      // show error message
      Fluttertoast.showToast(
          msg: error.message.toString(),
          fontSize: 16,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.blue);
    }
  }

  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void iconTapped() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15.0),
                // LOGO
                Image.asset(
                  'assets/list.png',
                  height: 50,
                ),

                const SizedBox(height: 30),

                // LET'S GET STARTED TEXT
                Text(
                  "Let's get started!",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'San Francisco',
                      color: Colors.grey.shade700),
                ),

                const SizedBox(height: 20.0),

                // TEXTFORMFIELD
                EmailFormField(
                  controller: emailController,
                  labelText: 'Email Address',
                  obscureText: false,
                  hintText: 'e.g example@gmail.com',
                  maxLength: 50,
                ),

                // PASSWORD TEXTFORMFIELD
                PasswordFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: !isClicked ? true : false,
                  hintText: 'e.g Qwerty1234',
                  maxLength: 15,
                  iconData: isClicked ? Icons.visibility : Icons.visibility_off,
                  onTap: iconTapped,
                ),

                // CONFIRM PASSWORD TEXTFORMFIELD
                PasswordFormField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  obscureText: !isClicked ? true : false,
                  hintText: 'e.g Qwerty1234',
                  maxLength: 15,
                  iconData: isClicked ? Icons.visibility : Icons.visibility_off,
                  onTap: iconTapped,
                ),

                const SizedBox(height: 20.0),

                // LOGIN OR SIGN UP BUTTON
                LoginOrSignUpButton(
                  onTap: signUserUp,
                  buttonName: 'Register',
                ),

                const SizedBox(height: 50.0),

                // OR CONTINUE WITH TEXT
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'San Francisco',
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // GOOGLE SIGN IN
                CircleTile(image: 'assets/google-logo.png'),
                const SizedBox(
                  height: 20,
                ),

                // REGISTER NOW TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          color: Colors.grey[700], fontFamily: 'San Francisco'),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontFamily: 'San Francisco',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
