import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/pages/login_page.dart';
import 'package:todo_app/utils/loader.dart';

import 'login_or_register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  // is the user logged in
                  if (snapshot.hasData) {
                    return HomePage();
                  }

                  // is the user NOT logged in
                  else {
                    return LoginOrRegisterPage();
                  }
                }),
          );
  }
}
