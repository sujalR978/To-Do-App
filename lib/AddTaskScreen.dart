import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:popover/popover.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/TaskSaveScreen.dart';
import 'package:to_do_app/addCategoryScreen.dart';

import 'package:to_do_app/categoryFunction.dart';
import 'package:to_do_app/setReminder.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime _date = DateTime.now();

  void _datePicker() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    ).then((value) {
      setState(() {
        _date = value!;
      });
    });
  }

  TimeOfDay _time = TimeOfDay.now();
  void _timePicker() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now()).then((
      value,
    ) {
      setState(() {
        _time = value!;
      });
    });
  }

  String? selectedCategory = "work";

  final keyForm = GlobalKey<FormState>();

  //list
  List _category_list = [];

  //task filed input
  final _taskName = TextEditingController();
  final _taskdisc = TextEditingController();

  @override
  void initState() {
    super.initState();
    getdata();
  }

  List<String> test = [];

  void getdata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    test = sp.getStringList('Task') ?? [];
    _category_list = sp.getStringList('cat') ?? [];

    setState(() {});
  }

  @override
  void dispose() {
    _taskName.dispose();
    _taskdisc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Row(
          children: [const SizedBox(width: 15), const Text('New Task')],
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),

            child: Column(
              children: [
                // PROGRESS BAR
                Padding(
                  padding: const EdgeInsets.only(top: 20),

                  child: SizedBox(
                    width: 350,

                    child: LinearProgressIndicator(
                      value: 0.7,
                      backgroundColor: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                      minHeight: 7,

                      valueColor: const AlwaysStoppedAnimation(
                        Color.fromARGB(255, 78, 102, 171),
                      ),
                    ),
                  ),
                ),

                // TASK NAME
                Column(
                  children: [
                    Form(
                      key: keyForm,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,

                            child: Padding(
                              padding: EdgeInsets.only(top: 30, left: 20),

                              child: Text(
                                'Task',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15,
                              right: 15,
                              top: 8,
                            ),

                            child: Opacity(
                              opacity: 0.5,

                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Enter your task.';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                controller: _taskName,
                                decoration: InputDecoration(
                                  hintText: 'What needs to be done?',
                                  filled: true,
                                  fillColor: const Color.fromARGB(
                                    246,
                                    232,
                                    232,
                                    250,
                                  ),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _taskName.clear();
                                      });
                                    },
                                    icon: Icon(Icons.clear),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Column(
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,

                                child: Padding(
                                  padding: EdgeInsets.only(left: 20, top: 20),

                                  child: Text(
                                    'Description',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),

                                child: Opacity(
                                  opacity: 0.5,

                                  child: TextFormField(
                                    minLines: 5,
                                    maxLines: 10,
                                    controller: _taskdisc,
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Enter task description. (ignore by "-")';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                        246,
                                        232,
                                        232,
                                        250,
                                      ),

                                      hintText:
                                          'Add more details about this task...',

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
                        ],
                      ),
                    ),
                  ],
                ),

                // DESCRIPTION

                // CATEGORY TITLE
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 20),

                      child: Text(
                        'Category',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                    const Spacer(),

                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 20),
                      child: TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(content: Addcategoryscreen());
                            },
                          );
                        },
                        child: const Text(
                          '+ Add New',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 73, 70, 168),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // CHOICE CHIPS
                Padding(
                  padding: const EdgeInsets.only(top: 10),

                  child: Row(
                    children: [
                      // PERSONAL
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 40,
                          width: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,

                            itemCount: _category_list.length,

                            itemBuilder: (context, index) {
                              return categoryFunction(
                                child: _category_list[index],
                                isSelected:
                                    selectedCategory == _category_list[index],
                                onSelect: () => setState(() {
                                  selectedCategory = _category_list[index];
                                }),
                                onLongpress: () async {
                                  setState(() {
                                    _category_list.removeAt(index);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 170, top: 10),
                  child: Opacity(
                    opacity: 0.5,
                    child: Text('Long press to remove category.'),
                  ),
                ),

                // DATE & TIME
                Row(
                  children: [
                    // DATE
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 20,
                            bottom: 10,
                          ),

                          child: Text(
                            'Due Date',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),

                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),

                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),

                            child: MaterialButton(
                              onPressed: _datePicker,

                              minWidth: 175,
                              height: 80,
                              color: Colors.white,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),

                              child: Padding(
                                padding: EdgeInsets.only(left: 0),

                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: const Color.fromARGB(
                                          255,
                                          52,
                                          83,
                                          238,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 10),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width: 100,
                                        child: Text(
                                          DateFormat(
                                            'yMMMMd',
                                          ).format(_date).toString(),

                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // TIME
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            left: 30,
                            bottom: 10,
                          ),

                          child: Text(
                            'Time',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 0),
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 5,
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 7,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: MaterialButton(
                              onPressed: _timePicker,
                              height: 60,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.timer_sharp,
                                    color: const Color.fromARGB(
                                      255,
                                      52,
                                      83,
                                      238,
                                    ),
                                    size: 30,
                                  ),
                                  SizedBox(width: 10),

                                  Padding(
                                    padding: const EdgeInsets.only(left: 0),
                                    child: Container(
                                      child: Text(
                                        _time.format(context).toString(),

                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(246, 232, 232, 250),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 7,
                          spreadRadius: 3,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => setReminder(),
                            ),
                          );
                        });
                      },
                      leading: Image.asset(
                        'assets/images/Reminder.png',
                        width: 40,
                      ),

                      title: Text(
                        'Reminder',
                        style: TextStyle(fontWeight: FontWeight(500)),
                      ),
                      subtitle: Text(
                        '10m before',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight(400),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    right: 20,
                    left: 20,
                    top: 80,
                    bottom: 20,
                  ),
                  child: SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 75, 52, 177),
                      ),

                      // add data into lists
                      onPressed: () async {
                        if (keyForm.currentState!.validate()) {
                          SharedPreferences sp =
                              await SharedPreferences.getInstance();

                          // CURRENT VALUES
                          String title = _taskName.text;

                          String descriptionText = _taskdisc.text;

                          String categoryText =
                              selectedCategory ?? "No Category";

                          // FORMATTED DATE
                          String dateText =
                              "${_date.day}/${_date.month}/${_date.year}";

                          // FORMATTED TIME
                          String timeText = _time.format(context);

                          // OLD SAVED DATA
                          List<String> task = sp.getStringList("Task") ?? [];

                          List<String> description =
                              sp.getStringList("description") ?? [];

                          List<String> date = sp.getStringList("date") ?? [];

                          List<String> time = sp.getStringList("time") ?? [];

                          List<String> category =
                              sp.getStringList("Category") ?? [];

                          // ADD NEW DATA
                          task.add(title);

                          description.add(descriptionText);

                          date.add(dateText);

                          time.add(timeText);

                          category.add(categoryText);

                          // SAVE DATA
                          await sp.setStringList("Task", task);

                          await sp.setStringList("description", description);

                          await sp.setStringList("date", date);

                          await sp.setStringList("time", time);

                          await sp.setStringList("Category", category);

                          // NAVIGATE
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) => TaskSaveScreen(
                                taskTitle: title,

                                taskDescription: descriptionText,

                                taskCategory: categoryText,

                                taskDate: dateText,

                                taskTime: timeText,
                              ),
                            ),
                          );

                          // CLEAR FIELDS
                          _taskName.clear();

                          _taskdisc.clear();

                          setState(() {
                            selectedCategory = "work";

                            _date = DateTime.now();

                            _time = TimeOfDay.now();
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/createTask.png',
                            height: 20,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Create Task',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight(600),
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
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
