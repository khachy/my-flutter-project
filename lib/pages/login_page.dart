import 'package:flutter/material.dart';
import 'package:todo_app/utils/login_or_signup_button.dart';
import 'package:todo_app/utils/my_button.dart';
import 'package:todo_app/utils/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                const Icon(
                  Icons.lock,
                  size: 100.0,
                ),
                const SizedBox(height: 50),
                Text(
                  "Welcome Back, you've been missed",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'San Francisco',
                      color: Colors.grey.shade700),
                ),
                const SizedBox(height: 20.0),
                MyTextField(
                  controller: emailController,
                  obscureText: false,
                  hintText: 'Email Address',
                ),
                MyTextField(
                  controller: passwordController,
                  obscureText: true,
                  hintText: 'Password',
                ),
                const SizedBox(height: 25.0),
                LoginOrSignUpButton(onTap: () {}, buttonName: 'Continue'),
                const SizedBox(height: 50.0),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
