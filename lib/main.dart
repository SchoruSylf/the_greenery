import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_greenery/add-ons/sign_in.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const TheGreenery());
}

class TheGreenery extends StatefulWidget {
  const TheGreenery({super.key});


  @override
  State<TheGreenery> createState() => _TheGreeneryState();
}

class _TheGreeneryState extends State<TheGreenery> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInFirebase()
    );
  }
}
