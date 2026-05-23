import 'package:flutter/material.dart';
import 'package:to_do_app/mainTaskScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Padding(
                padding: EdgeInsetsGeometry.only(top: 10),
                child: Container(
                  width: 250,
                  child: Text(
                    'Organize your day, focus on what matters, and achieve your goals with ease.',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainTask()),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 55),
                    backgroundColor: const Color.fromARGB(255, 75, 52, 177),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Opacity(
                  opacity: 0.5,
                  child: Text('PRODUCTIVITY REIMAGINED'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
