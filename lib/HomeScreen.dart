import 'package:flutter/material.dart';

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/homeIcon.png'),
                ),
                Text(
                  'Get Things Done',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight(800)),
                ),
                Text(
                  'Organize your day, focus on what matters, and achieve your goals with ease.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
