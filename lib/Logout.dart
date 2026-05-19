import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Logout());
}

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 233, 233),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios_rounded),
            ),
          ),

          title: Text('Settings', style: TextStyle(fontSize: 18)),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.asset('assets/images/logout.png'),
                ),
              ),
              Text(
                'Are you sure you want to log out?',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 60, top: 20),
                child: Text(
                  'Your pending tasks and flow state will be saved for your next session.',
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Log Out',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),

                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 50),
                    backgroundColor: const Color.fromARGB(255, 75, 52, 177),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 50),
                  backgroundColor: const Color.fromARGB(246, 232, 232, 250),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
