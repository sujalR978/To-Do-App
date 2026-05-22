import 'package:flutter/material.dart';

class categoryFunction extends StatefulWidget {
  const categoryFunction({super.key});

  @override
  State<categoryFunction> createState() => _categoryFunctionState();
}

class _categoryFunctionState extends State<categoryFunction> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: ChoiceChip(
          label: const Text(
            'Personal',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          showCheckmark: false,
          labelStyle: TextStyle(
            color: _isSelected ? Colors.white : Colors.black,
          ),
          selected: _isSelected,

          selectedColor: const Color.fromARGB(241, 44, 46, 163),

          backgroundColor: const Color.fromARGB(255, 220, 220, 245),

          avatar: Icon(
            Icons.person_4_outlined,
            color: _isSelected ? Colors.white : Colors.black,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),

          onSelected: (value) => {
            setState(() {
              _isSelected = value;
            }),
          },
        ),
      ),
    );
  }
}
