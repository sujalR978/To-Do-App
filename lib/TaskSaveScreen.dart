import 'package:flutter/material.dart';
import 'package:to_do_app/mainTaskScreen.dart';
import 'package:to_do_app/taskDetailScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskSaveScreen(
        taskTitle: "Study Flutter",
        taskDescription: "Complete SharedPreferences topic",
        taskCategory: "Work",
        taskDate: "2026-05-15",
        taskTime: "10:30 AM",
      ),
    ),
  );
}

class TaskSaveScreen extends StatefulWidget {
  final String taskTitle;
  final String taskDescription;
  final String taskCategory;
  final String taskDate;
  final String taskTime;

  const TaskSaveScreen({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.taskCategory,
    required this.taskDate,
    required this.taskTime,
  });

  @override
  State<TaskSaveScreen> createState() => _TaskSaveScreenState();
}

class _TaskSaveScreenState extends State<TaskSaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // IMAGE
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/TaskSaveIcon.png'),
                ),

                // TITLE
                const Text(
                  'Task Saved Successfully!',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),

                // SUBTITLE
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Opacity(
                    opacity: 0.6,
                    child: const Text(
                      'Your new task has been\norganized and added to your\nschedule.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                // BACK HOME BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const MainTask()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 75, 52, 177),
                      fixedSize: const Size(350, 60),
                    ),

                    child: const Text(
                      'Back to Home',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // VIEW DETAILS BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewTaskScreen(
                            taskTitle: widget.taskTitle,
                            taskDescription: widget.taskDescription,
                            taskCategory: widget.taskCategory,
                            taskDate: widget.taskDate,
                            taskTime: widget.taskTime,
                          ),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(246, 232, 232, 250),
                      fixedSize: const Size(350, 60),
                    ),

                    child: const Text(
                      'View Task Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // SMALL CARDS
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildMiniCard(const Color.fromARGB(197, 153, 112, 73)),

                    const SizedBox(width: 25),

                    buildMiniCard(const Color.fromARGB(197, 73, 125, 153)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMiniCard(Color color) {
    return Container(
      width: 150,
      height: 70,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: 35,
              width: 10,

              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 21),
                child: Container(
                  height: 10,
                  width: 80,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(153, 124, 144, 154),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8, top: 7),
                child: Container(
                  height: 10,
                  width: 40,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(132, 138, 149, 155),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
