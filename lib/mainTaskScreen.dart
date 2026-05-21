import 'package:flutter/material.dart';
import 'package:to_do_app/AddTaskScreen.dart';
import 'package:to_do_app/Logout.dart';

void main() {
  runApp(const MyApp());
}

// MAIN APP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainTask(),
    );
  }
}

// HOME SCREEN
class MainTask extends StatefulWidget {
  const MainTask({super.key});

  @override
  State<MainTask> createState() => _MainTaskState();
}

class _MainTaskState extends State<MainTask> {
  int selectedItem = 0;

  bool isCheck = false;

  // BOTTOM NAVIGATION PAGES
  final List<Widget> pages = [
    const HomePage(),
    const AddTaskScreen(),
    const Center(child: Text('Profile Screen', style: TextStyle(fontSize: 25))),
  ];

  void navigation(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),

      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: const Text(
          'Tasks',
          style: TextStyle(
            color: Color.fromARGB(255, 75, 52, 177),
            fontWeight: FontWeight.w500,
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

      // DRAWER
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 87, 95, 215),

        child: ListView(
          children: [
            // LOGO
            const DrawerHeader(
              child: Center(
                child: Text(
                  'L O G O',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // HOME
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),

              title: const Text(
                'Home',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),

              onTap: () {
                Navigator.pop(context);

                setState(() {
                  selectedItem = 0;
                });
              },
            ),

            // CREATE TASK
            ListTile(
              leading: const Icon(Icons.task_alt_outlined, color: Colors.white),

              title: const Text(
                'Create Task',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),

              onTap: () {
                Navigator.pop(context);

                setState(() {
                  selectedItem = 1;
                });
              },
            ),

            // PROFILE
            ListTile(
              leading: const Icon(Icons.person_4_outlined, color: Colors.white),

              title: const Text(
                'Profile',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),

              onTap: () {
                Navigator.pop(context);

                setState(() {
                  selectedItem = 2;
                });
              },
            ),

            const SizedBox(height: 250),

            Container(
              width: 280,
              margin: const EdgeInsets.symmetric(horizontal: 15),

              child: const Divider(color: Colors.white),
            ),

            // LOGOUT
            ListTile(
              leading: const Icon(Icons.logout_rounded, color: Colors.white),

              title: const Text(
                'Log Out',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),

              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const Logout()));
              },
            ),

            // SETTINGS
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),

              title: const Text(
                'Settings',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),

              onTap: () {},
            ),
          ],
        ),
      ),

      // BODY
      body: pages[selectedItem],

      // FLOATING BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const AddTaskScreen()));
        },

        child: const Icon(Icons.add),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,

        onTap: navigation,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: 'Create Task',
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person_4), label: 'Profile'),
        ],
      ),
    );
  }
}

// HOME PAGE UI
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // HELLO USER
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 20),

              child: Align(
                alignment: Alignment.topLeft,

                child: Text(
                  'Hello, User!',

                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
            ),

            // TASK COUNT
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 10),

              child: Align(
                alignment: Alignment.topLeft,

                child: Text(
                  'You have 5 tasks for today',

                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ),
            ),

            // PROGRESS BAR
            Padding(
              padding: const EdgeInsets.only(top: 25),

              child: SizedBox(
                width: 360,

                child: LinearProgressIndicator(
                  minHeight: 5,
                  value: 0.3,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),

            // TASK CARD
            Padding(
              padding: const EdgeInsets.only(top: 20),

              child: Container(
                width: 370,
                height: 90,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(10),

                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        108,
                        121,
                        168,
                      ).withOpacity(0.3),

                      blurRadius: 5,
                      offset: const Offset(3, 2),
                    ),
                  ],

                  border: const Border(
                    left: BorderSide(color: Colors.green, width: 4),
                  ),
                ),

                child: Row(
                  children: [
                    // CHECKBOX
                    Transform.scale(
                      scale: 1.3,

                      child: Checkbox(
                        shape: const CircleBorder(),

                        value: isCheck,

                        onChanged: (value) {
                          setState(() {
                            isCheck = value!;
                          });
                        },
                      ),
                    ),

                    // TEXT SECTION
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        const Text(
                          'Call Mom',

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(99, 124, 77, 255),

                            borderRadius: BorderRadius.circular(50),
                          ),

                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),

                            child: Text(
                              'WORK',

                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // MENU
                    IconButton(
                      onPressed: () {},

                      icon: const Icon(Icons.more_vert_outlined),
                    ),
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
