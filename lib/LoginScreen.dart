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
                        padding: EdgeInsets.only(left: 20, top: 25, bottom: 10),
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
                        padding: EdgeInsets.only(top: 15, left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(fontWeight: FontWeight(500)),
                            ),

                            SizedBox(width: 150),
                            TextButton(
                              onPressed: () {},

                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 68, 87, 255),
                                ),
                              ),
                            ),
                          ],
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

                      Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 25,
                          bottom: 20,
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Sing In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight(400),
                            ),
                          ),

                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(350, 50),
                            backgroundColor: const Color.fromARGB(
                              255,
                              75,
                              52,
                              177,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 20, right: 20),

                        child: Row(
                          children: [
                            Expanded(child: Divider(thickness: 1)),
                            Opacity(
                              opacity: 0.5,

                              child: Text(
                                "OR CONTINUE WITH",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Expanded(child: Divider(thickness: 1)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                             
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                              ),
                               child: Row(
                                children: [
                                  Image.asset('assets/images/google.png')
                                ],
                               ),
                            ),
                          ],
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
