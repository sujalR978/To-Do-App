import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditScreen extends StatefulWidget {
  final String taskname;

  const EditScreen({super.key, required this.taskname});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  DateTime textDate = DateTime.now();
  TimeOfDay textTime = TimeOfDay.now();

  int index = 0;

  List task = [];
  List desc = [];
  List date = [];
  List time = [];

  final TextEditingController taskController = TextEditingController();

  final TextEditingController descController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  final TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    data();
  }

  void data() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    task = sp.getStringList("Task") ?? [];
    desc = sp.getStringList("description") ?? [];
    date = sp.getStringList("date") ?? [];
    time = sp.getStringList("time") ?? [];

    index = task.indexOf(widget.taskname);

    taskController.text = task[index];
    descController.text = desc[index];
    dateController.text = date[index];
    timeController.text = time[index];

    setState(() {});
  }

  void _calendar() async {
    DateTime? value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (value != null) {
      setState(() {
        textDate = value;

        dateController.text = "${value.day}/${value.month}/${value.year}";
      });
    }
  }

  void _time() async {
    TimeOfDay? value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (value != null) {
      setState(() {
        textTime = value;

        timeController.text = value.format(context);
      });
    }
  }

  Future<void> updateTask() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    task[index] = taskController.text;
    desc[index] = descController.text;
    date[index] = dateController.text;
    time[index] = timeController.text;

    await sp.setStringList("Task", task.cast<String>());
    await sp.setStringList("description", desc.cast<String>());
    await sp.setStringList("date", date.cast<String>());
    await sp.setStringList("time", time.cast<String>());

    Navigator.pop(context);
  }

  InputDecoration customDecoration(String label, IconData icon) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,

      prefixIcon: Icon(icon, color: Colors.deepPurple),

      labelText: label,

      labelStyle: const TextStyle(color: Colors.black87),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F3FF),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,

        title: const Text(
          "Edit Task",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(25),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),

              child: Column(
                children: [
                  TextFormField(
                    controller: taskController,
                    decoration: customDecoration("Task", Icons.task_alt),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: descController,
                    maxLines: 4,

                    decoration: customDecoration(
                      "Description",
                      Icons.description,
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: dateController,
                    readOnly: true,
                    onTap: _calendar,

                    decoration: customDecoration("Date", Icons.calendar_month),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: timeController,
                    readOnly: true,
                    onTap: _time,

                    decoration: customDecoration("Time", Icons.access_time),
                  ),

                  const SizedBox(height: 35),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),

                      onPressed: updateTask,

                      child: const Text(
                        "Update Task",

                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
