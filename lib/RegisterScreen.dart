import 'dart:async';
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
                      Align(
                        alignment: AlignmentGeometry.bottomLeft,
                        child: Padding(
                          padding: EdgeInsetsGeometry.only(
                            top: 25,
                            left: 20,
                            bottom: 5,
                          ),
                          child: Text(
                            'Profession',
                            style: TextStyle(
                              fontWeight: FontWeight(500),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.name,

                          decoration: InputDecoration(
                            fillColor: Color.fromARGB(246, 232, 232, 250),
                            filled: true,
                            hintText: 'Enter Your Profession',
                            prefixIcon: Icon(Icons.work),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                            left: 20,
                            bottom: 5,
                          ),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(246, 232, 232, 250),
                            hintText: 'Enter Email here...',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),

                      Align(
                        alignment: AlignmentGeometry.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 25,
                            left: 20,
                            bottom: 5,
                          ),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight(500),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.only(
                          left: 15,
                          right: 15,
                          bottom: 45,
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'Enter Password here...',
                            fillColor: Color.fromARGB(246, 232, 232, 250),
                            filled: true,
                            prefixIcon: Icon(Icons.password),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: ElevatedButton(
                          onPressed: () {
                            print('button pressed!');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Sing Up',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 20,
                                width: 18,
                                child: Image.asset(('assets/images/arrow.png')),
                              ),
                            ],
                          ),

                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(350, 50),
                            backgroundColor: const Color.fromARGB(
                              255,
                              75,
                              52,
                              177,
                            ),
                            textStyle: TextStyle(color: Colors.black),
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
