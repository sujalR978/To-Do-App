import 'package:flutter/material.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsetsGeometry.only(left: 20),
          child: Container(
            width: 150,
            
            child: Text('Welcome back. Ready for focus?')),
          
        ),
      ),
    );
  }
}
