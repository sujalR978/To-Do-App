import 'package:flutter/material.dart';

class categoryFunction extends StatefulWidget {
  final String child;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onLongpress;

  const categoryFunction({
    super.key,
    required this.child,
    required this.isSelected,
    required this.onSelect,
    required this.onLongpress,
  });

  @override
  State<categoryFunction> createState() => _categoryFunctionState();
}

class _categoryFunctionState extends State<categoryFunction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),

      child: GestureDetector(
        onLongPress: widget.onLongpress,

        child: ChoiceChip(
          label: Text(
            widget.child,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),

          showCheckmark: false,

          labelStyle: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black,
          ),

          selected: widget.isSelected,

          selectedColor: const Color.fromARGB(241, 44, 46, 163),

          backgroundColor: const Color.fromARGB(255, 220, 220, 245),

          avatar: Icon(
            Icons.deblur,
            color: widget.isSelected ? Colors.white : Colors.black,
          ),

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
