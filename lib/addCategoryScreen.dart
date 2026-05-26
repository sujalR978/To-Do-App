import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addcategoryscreen extends StatefulWidget {
  const Addcategoryscreen({super.key});

  @override
  State<Addcategoryscreen> createState() => _AddcategoryscreenState();
}

class _AddcategoryscreenState extends State<Addcategoryscreen> {
  final TextEditingController _category = TextEditingController();
  final _check = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _check,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter category';
                }
                return null;
              },
              controller: _category,
              decoration: const InputDecoration(
                hintText: 'Enter category',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          const SizedBox(height: 15),

          ElevatedButton(
            onPressed: () async {
              if (_check.currentState!.validate()) {
                SharedPreferences sp = await SharedPreferences.getInstance();

                List<String> catList = sp.getStringList('cat') ?? [];

                catList.add(_category.text);

                await sp.setStringList('cat', catList);

                _category.clear();

                Navigator.pop(context);
              }
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
