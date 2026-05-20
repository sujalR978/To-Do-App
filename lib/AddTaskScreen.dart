import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ONLY HOLDS MATERIALAPP
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Date Picker Example',
      home: const AddTaskScreen(),
    );
  }
}

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  bool _isWork = false;
  bool _isPersnoal = false;
  bool _isShopping = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),

            const SizedBox(width: 15),

            const Text('New Task'),
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
                    const Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: EdgeInsets.only(top: 30, left: 20),

                        child: Text(
                          'Task Name',
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
                          keyboardType: TextInputType.text,

                          decoration: InputDecoration(
                            hintText: 'What needs to be done?',
                            filled: true,
                            fillColor: const Color.fromARGB(246, 232, 232, 250),

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

                // DESCRIPTION
                Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,

                      child: Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),

                        child: Text(
                          'Description',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),

                      child: Opacity(
                        opacity: 0.5,

                        child: TextFormField(
                          minLines: 5,
                          maxLines: 10,

                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(246, 232, 232, 250),

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
                        onPressed: () {},

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
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      // WORK
                      ChoiceChip(
                        label: const Text(
                          'Work',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),

                        showCheckmark: false,

                        backgroundColor: const Color.fromARGB(
                          255,
                          220,
                          220,
                          245,
                        ),

                        selected: _isWork,

                        selectedColor: const Color.fromARGB(241, 44, 46, 163),

                        labelStyle: TextStyle(
                          color: _isWork ? Colors.white : Colors.black,
                        ),

                        avatar: Icon(
                          Icons.work_outline,
                          color: _isWork ? Colors.white : Colors.black,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),

                        onSelected: (value) {
                          setState(() {
                            _isWork = value;
                            _isShopping = false;
                            _isPersnoal = false;
                          });
                        },
                      ),

                      const SizedBox(width: 10),

                      // SHOPPING
                      ChoiceChip(
                        label: const Text(
                          'Shopping',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),

                        showCheckmark: false,

                        selected: _isShopping,

                        selectedColor: const Color.fromARGB(241, 44, 46, 163),

                        backgroundColor: const Color.fromARGB(
                          255,
                          220,
                          220,
                          245,
                        ),

                        labelStyle: TextStyle(
                          color: _isShopping ? Colors.white : Colors.black,
                        ),

                        avatar: Icon(
                          Icons.shopping_cart_outlined,
                          color: _isShopping ? Colors.white : Colors.black,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),

                        onSelected: (value) {
                          setState(() {
                            _isShopping = value;
                            _isWork = false;
                            _isPersnoal = false;
                          });
                        },
                      ),

                      const SizedBox(width: 10),

                      // PERSONAL
                      ChoiceChip(
                        label: const Text(
                          'Personal',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),

                        showCheckmark: false,

                        selected: _isPersnoal,

                        selectedColor: const Color.fromARGB(241, 44, 46, 163),

                        backgroundColor: const Color.fromARGB(
                          255,
                          220,
                          220,
                          245,
                        ),

                        labelStyle: TextStyle(
                          color: _isPersnoal ? Colors.white : Colors.black,
                        ),

                        avatar: Icon(
                          Icons.person_4_outlined,
                          color: _isPersnoal ? Colors.white : Colors.black,
                        ),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),

                        onSelected: (value) {
                          setState(() {
                            _isPersnoal = value;
                            _isWork = false;
                            _isShopping = false;
                          });
                        },
                      ),
                    ],
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
                                padding: EdgeInsets.only(right: 70),

                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today_outlined),

                                    SizedBox(width: 10),

                                    Text(
                                      _date.toString(),

                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30, left: 20),

                          child: Text(
                            'Time',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
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
