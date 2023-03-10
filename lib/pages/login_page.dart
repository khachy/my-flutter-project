import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/pages/forgot_password_page.dart';
import 'package:todo_app/utils/loader.dart';
import 'package:todo_app/utils/login_or_signup_button.dart';
import 'package:todo_app/utils/email_textfield.dart';
import 'package:todo_app/utils/circle_tile.dart';
import 'package:todo_app/utils/password_textfield.dart';

class LoginPage extends StatefulWidget {
  void Function()? onTap;
  LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool isClicked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  // sign in method
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Loader(text: 'PLEASE WAIT...');
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);

      // validate the form
      formKey.currentState?.validate();
    } on FirebaseAuthException catch (error) {
      // show error message
      Fluttertoast.showToast(
          msg: error.message.toString(),
          fontSize: 18,
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
                  height: 70,
                ),

                const SizedBox(height: 30),

                // WELCOME BACK TEXT
                Text(
                  "Welcome Back, you've been missed",
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
                PasswordFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  obscureText: !isClicked ? true : false,
                  hintText: 'e.g Qwerty1234',
                  maxLength: 15,
                  iconData: isClicked ? Icons.visibility : Icons.visibility_off,
                  onTap: iconTapped,
                ),

                // FORGOT PASSWORD TEXT
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontFamily: 'San Francisco',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ForgotPasswordPage();
                    }));
                  },
                ),

                const SizedBox(height: 25.0),

                // LOGIN OR SIGN UP BUTTON
                LoginOrSignUpButton(
                  onTap: signUserIn,
                  buttonName: 'Continue',
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
                const SizedBox(height: 30),

                // GOOGLE SIGN IN
                CircleTile(image: 'assets/google-logo.png'),
                const SizedBox(
                  height: 35,
                ),

                // REGISTER NOW TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                          color: Colors.grey[700], fontFamily: 'San Francisco'),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register now',
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
