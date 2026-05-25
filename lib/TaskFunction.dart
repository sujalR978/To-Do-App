import 'package:flutter/material.dart';

class TaskFunction extends StatefulWidget {
  final dynamic child;
  final String category;
  const TaskFunction({super.key, required this.child, required this.category});

  @override
  State<TaskFunction> createState() => _TaskFunctionState();
}

class _TaskFunctionState extends State<TaskFunction> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: 370,
        height: 90,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.circular(10),

          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 108, 121, 168).withOpacity(0.3),

              blurRadius: 5,
              offset: const Offset(3, 2),
            ),
          ],

          border: const Border(left: BorderSide(color: Colors.green, width: 4)),
        ),

        child: Row(
          children: [
            // CHECKBOX
            Transform.scale(
              scale: 1.3,

              child: Checkbox(
                shape: const CircleBorder(),

                value: _isCheck,

                onChanged: (value) {
                  setState(() {
                    _isCheck = value!;
                  });
                },
              ),
            ),

            // TEXT SECTION
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  widget.child,

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: _isCheck ? FontWeight(300) : FontWeight(500),
                    decoration: _isCheck
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),

                const SizedBox(height: 8),

                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(99, 124, 77, 255),

                    borderRadius: BorderRadius.circular(50),
                  ),

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),

                    child: Text(
                      widget.category,

                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            // MENU
            IconButton(
              onPressed: () {},

              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
