import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const RegisterScreen());
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 243, 239, 239),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 90),
                child: Container(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/image.png'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, bottom: 7),
                child: Text(
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight(500)),
                ),
              ),
              Container(
                width: 350,
                child: const Text(
                  'Join our community of focused achievers today.',
                  style: TextStyle(fontSize: 17),

                  maxLines: 2,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,

                margin: EdgeInsets.only(left: 15, right: 15, top: 35),
                decoration: BoxDecoration(
                  color:
                      Colors.white, // Container color must be inside decoration
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1, // How much the shadow spreads
                      blurRadius: 5, // Softness of the shadow
                      offset: Offset(0, 5), // Changes position of shadow (x, y)
                    ),
                  ],
                ),

                child: Form(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,

                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            bottom: 5,
                            left: 20,
                          ),
                          child: const Text(
                            'Name',
                            style: TextStyle(
                              fontWeight: FontWeight(500),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          autofillHints: [AutofillHints.email],

                          decoration: InputDecoration(
                            hintText: 'Enter Name here...',

                            fillColor: Color.fromARGB(246, 232, 232, 250),
                            filled: true,
                            prefixIcon: Icon(Icons.person_rounded),
                            border: OutlineInputBorder(
                              gapPadding: 0,
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
