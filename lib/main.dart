import 'package:flutter/material.dart';
import 'package:to_do_app/SplashScreen.dart';
import 'package:to_do_app/add%20notes.dart';

void main() {
  runApp( AddNotePage());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const SplashScreen());
  }
}
