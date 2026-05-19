import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Calm Productivity',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
