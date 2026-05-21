import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/AddTaskScreen.dart';
import 'package:to_do_app/LoginScreen.dart';
import 'package:to_do_app/Logout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: mainTask());
  }
}

class mainTask extends StatefulWidget {
  const mainTask({super.key});

  @override
  State<mainTask> createState() => _mainTaskState();
}

class _mainTaskState extends State<mainTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Tasks',
          style: TextStyle(
            color: Color.fromARGB(255, 75, 52, 177),
            fontWeight: FontWeight(500),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),

            child: Container(
              height: 35,
              width: 35,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
              ),

              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
                iconSize: 15,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 87, 95, 215),

        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  'L O G O',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight(600),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight(500),
                ),
              ),
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (Builder) => mainTask()));
              },
            ),
            ListTile(
              leading: Icon(Icons.task_alt_outlined, color: Colors.white),
              title: Text(
                'Create Task',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight(500),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (Builder) => AddTaskScreen()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.person_4_outlined, color: Colors.white),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight(500),
                ),
              ),
              onTap: () {},
            ),

            Padding(
              padding: const EdgeInsets.only(top: 325),
              child: Container(
                child: Column(
                  children: [
                    Container(width: 280, child: Divider(height: 12)),
                    ListTile(
                      leading: Icon(Icons.logout_rounded, color: Colors.white),
                      title: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (Builder) => Logout()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.white),
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight(500),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20),
              child: Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(
                  'Hello, User!',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight(600)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Align(
                alignment: AlignmentGeometry.topStart,
                child: Text(
                  'You have 5 tasks for today',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight(350)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 360,
                child: LinearProgressIndicator(
                  minHeight: 5,
                  value: 0.3,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

            Container(
              
            ),
          ],
        ),
      ),
    );
  }
}
