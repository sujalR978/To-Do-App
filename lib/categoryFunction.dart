import 'package:flutter/material.dart';

class categoryFunction extends StatefulWidget {
  final String child;
  final bool isSelected;
  final VoidCallback onSelect;
  categoryFunction({
    super.key,
    required this.child,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  State<categoryFunction> createState() => _categoryFunctionState();
}

class _categoryFunctionState extends State<categoryFunction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        child: ChoiceChip(
          label: Text(
            widget.child,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),

          showCheckmark: false,
          labelStyle: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
          selected: widget.isSelected,

          selectedColor: const Color.fromARGB(241, 44, 46, 163),

          backgroundColor: const Color.fromARGB(255, 220, 220, 245),

          // avatar: Icon(
          //   Icons.person_4_outlined,
          //   color: widget.isSelected ? Colors.white : Colors.black,
          // ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),

          onSelected: (value) {
            widget.onSelect();
          },
        ),
      ),
    );
  }
}
