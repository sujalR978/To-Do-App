import 'package:flutter/material.dart';

void main() {
  runApp(AddNotePage());
}

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _saveNote() {
    String title = _titleController.text.trim();
    String content = _contentController.text.trim();

    if (title.isNotEmpty && content.isNotEmpty) {
      // Here you can add logic to save the note, e.g., to a database or a file
      print('Title: $title');
      print('Content: $content');

      // Clear the text fields after saving
      _titleController.clear();
      _contentController.clear();

      // Navigate back to the previous page
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter both title and content')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _saveNote, child: Text('Save Note')),
          ],
        ),
      ),
    );
  }
}
