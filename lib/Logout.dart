import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/LoginScreen.dart';
import 'package:to_do_app/mainTaskScreen.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 233, 233),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => MainTask()));
            },
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
              child: SizedBox(
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
                onPressed: () async {
                  SharedPreferences spget =
                      await SharedPreferences.getInstance();
                  await spget.setBool('LogIn', false);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },

                style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 50),
                  backgroundColor: const Color.fromARGB(255, 75, 52, 177),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => MainTask()));
              },

              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 50),
                backgroundColor: const Color.fromARGB(246, 232, 232, 250),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 18,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),

            Opacity(
              opacity: 0.5,
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(width: 2.0, color: Colors.black),
                      ),
                      child: Icon(Icons.person_4_outlined, size: 15),
                    ),
                    SizedBox(width: 7),
                    Text('Logged in as user@example.com'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
