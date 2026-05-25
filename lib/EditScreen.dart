import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class editScreen extends StatefulWidget {
  final String taskname;

  const editScreen({super.key, required this.taskname});

  @override
  State<editScreen> createState() => _editScreenState();
}

DateTime textDate = DateTime.now();
TimeOfDay textTime = TimeOfDay.now();

class _editScreenState extends State<editScreen> {
  void _calander() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        textDate = value!;
      });
    });
  }

  void _time() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((
      value,
    ) {
      setState(() {
        textTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: widget.taskname,
                label: Text('Task'),
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: '',
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
            ),

            TextFormField(
              onTap: _calander,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'widget.date',
                label: Text('Date'),
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              onTap: _time,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: '',
                label: Text('time'),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
