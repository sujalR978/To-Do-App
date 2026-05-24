import 'package:flutter/material.dart';

class ViewTaskScreen extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final String taskCategory;
  final String taskDate;
  final String taskTime;

  const ViewTaskScreen({
    super.key,
    required this.taskTitle,
    required this.taskDescription,
    required this.taskCategory,
    required this.taskDate,
    required this.taskTime,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 241, 241),

      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: const Text(
          'Task Details',
          style: TextStyle(
            color: Color.fromARGB(255, 75, 52, 177),
            fontWeight: FontWeight.w500,
          ),
        ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TASK TITLE
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Task',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        taskTitle,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // DESCRIPTION
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        taskDescription,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // CATEGORY
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),

                        decoration: BoxDecoration(
                          color: const Color.fromARGB(99, 124, 77, 255),
                          borderRadius: BorderRadius.circular(50),
                        ),

                        child: Text(
                          taskCategory,
                          style: const TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // DATE & TIME
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              color: Color.fromARGB(255, 75, 52, 177),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              'Date',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              taskDate,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            const Icon(
                              Icons.access_time,
                              color: Color.fromARGB(255, 75, 52, 177),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              'Time',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              taskTime,
                              textAlign: TextAlign.center,
                            ),
                          ],
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
}