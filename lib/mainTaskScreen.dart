import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: mainTask(),
    );
  }
}class mainTask extends StatefulWidget {
  const mainTask({super.key});

  @override
  State<mainTask> createState() => _mainTaskState();
}

class _mainTaskState extends State<mainTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(backgroundColor: Colors.amber,),
      
    );
  }
}