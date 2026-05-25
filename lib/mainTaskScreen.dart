import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/AddTaskScreen.dart';
import 'package:to_do_app/Logout.dart';
import 'package:to_do_app/TaskFunction.dart';
import 'package:to_do_app/taskDetailScreen.dart';

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

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AddTaskScreen()),
                );
              },
            ),

            // PROFILE
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
  List<String> _taskTital = [];
  List<String> _categoryTital = [];
  List<String> _description = [];
  List<String> _date = [];
  List<String> _time = [];
  //main task list

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();
  }

  void getdata() async {
    SharedPreferences spget = await SharedPreferences.getInstance();

    setState(() {
      _taskTital = spget.getStringList("Task") ?? [];

      _categoryTital = spget.getStringList("Category") ?? [];

      _description = spget.getStringList("description") ?? [];

      _date = spget.getStringList("date") ?? [];

      _time = spget.getStringList("time") ?? [];
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getdata();
  }

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
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),

              child: Align(
                alignment: Alignment.topLeft,

                child: Text(
                  'You have ${_taskTital.length} tasks for today',

                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
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
            SizedBox(
              height: 19000,
              width: 370,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: _taskTital.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewTaskScreen(
                            taskTitle: _taskTital[index],

                            taskDescription: index < _description.length
                                ? _description[index]
                                : "No Description",

                            taskCategory: index < _categoryTital.length
                                ? _categoryTital[index]
                                : "No Category",

                            taskDate: index < _date.length
                                ? _date[index]
                                : "No Date",

                            taskTime: index < _time.length
                                ? _time[index]
                                : "No Time",
                          ),
                        ),
                      );
                    },

                    child: TaskFunction(
                      child: _taskTital[index],

                      category: index < _categoryTital.length
                          ? _categoryTital[index]
                          : "No Category",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
