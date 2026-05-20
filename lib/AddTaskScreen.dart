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
                Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
