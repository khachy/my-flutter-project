import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/utils/otp_form.dart';

class VerificationPage extends StatefulWidget {
  var otpController = TextEditingController();
  VerificationPage({
    super.key,
  });

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  // instantiate the user
  final user = FirebaseAuth.instance.currentUser;
  bool isEmailVerified = false;
  bool canResendEmail = false;

  @override
  void initState() {
    super.initState();

    if (!isEmailVerified) {
      sendOTP();
    }
  }

  void sendOTP() async {}

  @override
  Widget build(BuildContext context) {
    return isEmailVerified
        ? HomePage()
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                'VERIFY YOUR EMAIL',
                style: TextStyle(
                  fontFamily: 'San Francisco',
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 15.0),
                        child: Center(
                          child: Text(
                            'Enter the verification code sent to ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'San Francisco',
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${user?.email}',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  // the otp form screen
                  OtpForm(
                    controller: widget.otpController,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => canResendEmail ? sendOTP() : null,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 10.0),
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35.0, vertical: 12.0),
                          ),
                          child: Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
