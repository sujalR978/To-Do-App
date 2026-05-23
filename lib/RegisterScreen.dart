import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/HomeScreen.dart';
import 'package:to_do_app/LoginScreen.dart';
import 'package:to_do_app/mainTaskScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // name field
  final _name = TextEditingController();
  final _profession = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  List<String> test = [];
  List<String> emailCheck = [];
  void getdata() async {
    SharedPreferences spget = await SharedPreferences.getInstance();
    test.addAll(spget.getStringList("Name") ?? []);
    emailCheck.addAll(spget.getStringList('Email') ?? []);
  }

  @override
  void dispose() {
    _name.dispose();
    _profession.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 239, 239),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // LOGO
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset('assets/images/image.png'),
                  ),
                ),

                // TITLE
                Padding(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Text(
                    'Create Account',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                ),

                // SUBTITLE
                const SizedBox(
                  width: 350,
                  child: Text(
                    'Join our community of focused achievers today.',
                    style: TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ),

                // FORM CONTAINER
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 15, right: 15, top: 35),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // NAME
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              bottom: 5,
                              left: 20,
                            ),
                            child: Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your name.';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.text,
                            controller: _name,

                            decoration: InputDecoration(
                              hintText: 'Enter Name here...',
                              fillColor: const Color.fromARGB(
                                246,
                                232,
                                232,
                                250,
                              ),
                              filled: true,
                              prefixIcon: const Icon(Icons.person_rounded),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        // PROFESSION
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 20,
                              bottom: 5,
                            ),
                            child: Text(
                              'Profession',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your profession';
                              }
                              return null;
                            },
                            controller: _profession,
                            decoration: InputDecoration(
                              hintText: 'Enter Your Profession',
                              fillColor: const Color.fromARGB(
                                246,
                                232,
                                232,
                                250,
                              ),
                              filled: true,
                              prefixIcon: const Icon(Icons.work),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        // EMAIL
                        const Align(
                          alignment: Alignment.bottomLeft,
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your Email';
                              } else if (emailCheck.contains(
                                value.toString().trim(),
                              )) {
                                return 'Duplicate Email';
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter Email here...',
                              fillColor: const Color.fromARGB(
                                246,
                                232,
                                232,
                                250,
                              ),
                              filled: true,
                              prefixIcon: const Icon(Icons.email),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        // PASSWORD
                        const Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 20,
                              bottom: 5,
                            ),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            bottom: 45,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            obscureText: true,
                            controller: _password,
                            decoration: InputDecoration(
                              hintText: 'Enter Password here...',
                              fillColor: const Color.fromARGB(
                                246,
                                232,
                                232,
                                250,
                              ),
                              filled: true,
                              prefixIcon: const Icon(Icons.password),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        // SIGN UP BUTTON
                        Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                //logic to save data
                                List<String> Name = [];
                                List<String> Profession = [];
                                List<String> Email = [];
                                List<String> Password = [];

                                Name.add(_name.text);
                                Profession.add(_profession.text);
                                Email.add(_email.text);
                                Password.add(_password.text);

                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();

                                sp.setStringList("Name", Name);
                                sp.setStringList("Profession", Profession);
                                sp.setStringList("Email", Email);
                                sp.setStringList("Password", Password);

                                getdata();

                                _name.clear();
                                _profession.clear();
                                _email.clear();
                                _password.clear();

                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );

                                  Timer(
                                    Duration(milliseconds: 2500),
                                    () => {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      ),
                                    },
                                  );
                                });
                              }
                            },

                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(350, 50),
                              backgroundColor: const Color.fromARGB(
                                255,
                                75,
                                52,
                                177,
                              ),
                            ),

                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),

                                const SizedBox(width: 10),

                                SizedBox(
                                  height: 20,
                                  width: 18,
                                  child: Image.asset('assets/images/arrow.png'),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // DIVIDER
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(child: Divider(thickness: 1)),

                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Text(
                                    "OR CONTINUE WITH",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),

                              Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                        ),

                        // SOCIAL BUTTONS
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 25,
                            top: 20,
                            bottom: 35,
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              socialButton(
                                'assets/images/google.png',
                                'Google',
                              ),

                              socialButton('assets/images/ios.png', 'Apple'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // LOGIN TEXT
                Padding(
                  padding: const EdgeInsets.only(top: 30),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 16),
                      ),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            color: Color.fromARGB(255, 33, 51, 243),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // TERMS
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'By signing up, you agree to our',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Terms of Service & Privacy Policy',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialButton(String image, String title) {
    return ElevatedButton(
      onPressed: () {},

      style: ElevatedButton.styleFrom(
        fixedSize: const Size(150, 50),
        backgroundColor: Colors.white,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 25, width: 25, child: Image.asset(image)),

          const SizedBox(width: 10),

          Text(title, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
