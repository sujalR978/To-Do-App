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
          title: Row(
            children: [
              IconButton(onPressed: ( 
                
              ){}, icon: Icon(Icons.arrow_back_ios_new_outlined))
            ],
          ),
        ),
      ),
    );
  }
}