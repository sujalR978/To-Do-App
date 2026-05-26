import 'package:flutter/material.dart';

class AddReminderScreen extends StatefulWidget {
  final taskname;
  const AddReminderScreen({super.key,required this.taskname});

  @override
  State<AddReminderScreen> createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  String repeatValue = "None";

  String alertStyle = "Standard";

  final List<String> repeatOptions = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
    "Custom",
  ];

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FF),

      appBar: AppBar(
        backgroundColor: const Color(0xffF8F9FF),
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        title: const Text(
          "Add Reminder",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),

            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.shade300,

              child: const Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// TITLE
            const Text(
              "REMIND ME ABOUT",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: const [
                  Text(
                    "Design Review",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// WHEN
            const Text(
              "WHEN",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: Column(
                children: [
                  /// DATE
                  InkWell(
                    onTap: pickDate,

                    child: Container(
                      padding: const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: const Color(0xffEEF3FF),

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Color(0xff4648D4),
                              ),

                              const SizedBox(width: 12),

                              Text(
                                "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                              ),
                            ],
                          ),

                          const Icon(Icons.expand_more),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// TIME
                  InkWell(
                    onTap: pickTime,

                    child: Container(
                      padding: const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: const Color(0xffEEF3FF),

                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                color: Color(0xff4648D4),
                              ),

                              const SizedBox(width: 12),

                              Text(selectedTime.format(context)),
                            ],
                          ),

                          const Icon(Icons.expand_more),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// REPEAT
            const Text(
              "REPEAT",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 45,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: repeatOptions.length,

                itemBuilder: (context, index) {
                  String option = repeatOptions[index];

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),

                    child: ChoiceChip(
                      label: Text(option),

                      selected: repeatValue == option,

                      onSelected: (value) {
                        setState(() {
                          repeatValue = option;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            /// ALERT STYLE
            const Text(
              "ALERT STYLE",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        alertStyle = "Standard";
                      });
                    },

                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(16),

                        border: Border.all(
                          color: alertStyle == "Standard"
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),

                      child: Column(
                        children: const [
                          Icon(Icons.notifications),

                          SizedBox(height: 10),

                          Text("Standard"),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        alertStyle = "Persistent";
                      });
                    },

                    child: Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(16),

                        border: Border.all(
                          color: alertStyle == "Persistent"
                              ? Colors.blue
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),

                      child: Column(
                        children: const [
                          Icon(Icons.priority_high),

                          SizedBox(height: 10),

                          Text("Persistent"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            /// BUTTONS
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4648D4),
                ),

                onPressed: () {},

                child: const Text(
                  "Set Reminder",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,

              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },

                child: const Text("Cancel"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
