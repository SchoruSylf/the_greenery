import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_greenery/page/bottomnav.dart';
import 'package:the_greenery/page/loginandregisterpage.dart';

class SignInFirebase extends StatefulWidget {
  const SignInFirebase({super.key});

  @override
  State<SignInFirebase> createState() => _SignInFirebaseState();
}

class _SignInFirebaseState extends State<SignInFirebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NavBarPage();
        } else {
          return LoginAndRegisterPage();
        }
      },
    ));
  }
}
