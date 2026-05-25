import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyWidget extends StatefulWidget {
  final String child;
  const MyWidget({super.key, required this.child});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 250,
          child: TextButton(
            onPressed: () async {
              SharedPreferences result = await SharedPreferences.getInstance();
              List<String> re = result.getStringList("Task") ?? [];
              re.remove(widget.child);

              await result.setStringList("Task", re);

              setState(() {
                
              });
            },
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ),
        Divider(thickness: 1),

        SizedBox(
          height: 50,
          width: 250,

          child: TextButton(
            onPressed: () {},
            child: Text('Edit', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
