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
        backgroundColor: const Color.fromARGB(255, 234, 230, 230),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 20, bottom: 16),
                child: Container(
                  width: 150,
                  child: Text(
                    'Welcome back. Ready for focus?',
                    style: TextStyle(fontSize: 18),
                    maxLines: 2,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, bottom: 25),
                child: Container(
                  width: 300,
                  child: Text(
                    'The minimalist path to your most productive day starts here.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        offset: Offset(0, 5),
                        blurRadius: 7,
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 25, bottom: 5),
                        child: Text(
                          'Email Address',
                          style: TextStyle(fontWeight: FontWeight(500)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Email here...',
                            fillColor: Color.fromARGB(246, 232, 232, 250),
                            filled: true,
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15, left: 20, bottom: 5),
                        child: Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight(500)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter password here...',
                            filled: true,
                            prefixIcon: Icon(Icons.password),
                            fillColor: Color.fromARGB(246, 232, 232, 250),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
