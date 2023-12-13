import 'package:flutter/material.dart';
import 'pdf_list_screen.dart'; // Make sure to create this file

class SubjectScreen extends StatelessWidget {
  final List<String> subjects = ['Chemistry', 'Physics', 'Biology'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Subject')),
      body: ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subjects[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfListScreen(subject: subjects[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

