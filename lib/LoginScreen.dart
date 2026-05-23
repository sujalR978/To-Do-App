import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/mainTaskScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  final List checkEmail = [];
  final List checkPassword = [];
  void getdata() async {
    SharedPreferences spget = await SharedPreferences.getInstance();
    checkEmail.addAll(spget.getStringList('Email') ?? []);
    checkPassword.addAll(spget.getStringList('Password') ?? []);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 230, 230),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const SizedBox(
                  width: 180,
                  child: Text(
                    'Welcome back. Ready for focus?',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'The minimalist path to your most productive day starts here.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _keyForm,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Address',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter email.';
                                }
                                if (checkEmail.contains(value.trim())) {
                                  return null;
                                } else {
                                  return 'Wrong Email';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Email here...',
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  246,
                                  232,
                                  232,
                                  250,
                                ),
                                prefixIcon: const Icon(Icons.email),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Password',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Forgot Password?'),
                                ),
                              ],
                            ),
                            TextFormField(
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter password.';
                                } else if (checkPassword.contains(
                                  value.trim(),
                                )) {
                                  return null;
                                } else {
                                  return 'Wrong Password';
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Enter Password here...',
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  246,
                                  232,
                                  232,
                                  250,
                                ),
                                prefixIcon: const Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                if (_keyForm.currentState!.validate()) {
                                  setState(() {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => MainTask(),
                                      ),
                                    );
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 55),
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  75,
                                  52,
                                  177,
                                ),
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("OR CONTINUE WITH"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          socialButton('assets/images/google.png', 'Google'),
                          socialButton('assets/images/ios.png', 'Apple'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget socialButton(String image, String title) {
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
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
