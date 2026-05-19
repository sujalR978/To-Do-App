import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TaskSaveScreen());
}

class TaskSaveScreen extends StatelessWidget {
  const TaskSaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/images/TaskSaveIcon.png'),
                ),
                Text(
                  'Task Saved Successfully!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight(600)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 30),
                  child: Opacity(
                    opacity: 0.6,
                    child: Text(
                      'Your new task has been\n organized and added to your \nschedule.',
                      style: TextStyle(fontSize: 18),

                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight(500),
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 75, 52, 177),
                    fixedSize: Size(350, 60),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'View Task Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight(500)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(246, 232, 232, 250),
                    fixedSize: Size(350, 60),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
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
                                  color: const Color.fromARGB(
                                    197,
                                    153,
                                    112,
                                    73,
                                  ),

                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 21,
                                  ),
                                  child: Container(
                                    height: 10,
                                    width: 80,

                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        153,
                                        124,
                                        144,
                                        154,
                                      ),

                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 7,
                                  ),
                                  child: Container(
                                    height: 10,
                                    width: 40,

                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        132,
                                        138,
                                        149,
                                        155,
                                      ),

                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
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
                                  color: const Color.fromARGB(
                                    197,
                                    73,
                                    125,
                                    153,
                                  ),

                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 21,
                                  ),
                                  child: Container(
                                    height: 10,
                                    width: 80,

                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        153,
                                        124,
                                        144,
                                        154,
                                      ),

                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    top: 7,
                                  ),
                                  child: Container(
                                    height: 10,
                                    width: 40,

                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        132,
                                        138,
                                        149,
                                        155,
                                      ),

                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
