import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AddTaskScreen());
}

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back_ios_new_outlined),
              ),
              SizedBox(width: 15),
              Text('New Task'),
            ],
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
                  icon: Icon(Icons.person),
                  iconSize: 15,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Determinate (Shows 70% progress)
                Container(
                  width: 350,
                  decoration: BoxDecoration(),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    minHeight: 7,

                    valueColor: AlwaysStoppedAnimation(
                      const Color.fromARGB(255, 78, 102, 171),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentGeometry.topStart,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: Text(
                            'Task Name',
                            style: TextStyle(fontWeight: FontWeight(500)),
                          ),
                        ),
                      ),

                      Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                            top: 8,
                          ),

                          child: TextFormField(
                            keyboardType: TextInputType.text,

                            decoration: InputDecoration(
                              hintText: 'What needs to be done?',
                              filled: true,
                              fillColor: Color.fromARGB(246, 232, 232, 250),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  child: Column(
                    children: [
                      Align(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20),
                          child: Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight(500)),
                          ),
                        ),
                        alignment: AlignmentGeometry.topStart,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Opacity(
                          opacity: 0.5,

                          child: TextFormField(
                            minLines:
                                5, // The field will start with a height of 5 lines
                            maxLines: 10,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromARGB(246, 232, 232, 250),
                              hintText: 'Add more details about this task...',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Align(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text(
                          'Category',
                          style: TextStyle(fontWeight: FontWeight(500)),
                        ),
                      ),
                      alignment: AlignmentGeometry.topStart,
                    ),
                    SizedBox(width: 200),

                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '+ Add New',
                          style: TextStyle(
                            fontWeight: FontWeight(500),
                            color: const Color.fromARGB(255, 73, 70, 168),
                          ),
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
