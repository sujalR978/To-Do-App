import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class menuItem extends StatelessWidget {
  const menuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 250,
          child: TextButton(
            onPressed: () {},
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
