import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

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
              GestureDetector(
                
              );
              
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
