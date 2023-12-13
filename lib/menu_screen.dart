import 'package:flutter/material.dart';
import 'subject_screen.dart'; // Make sure to create this file

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Past Papers'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubjectScreen()),
              );
            },
          ),
          ListTile(title: Text('Coming Soon')),
          ListTile(title: Text('Coming Soon')),
          ListTile(title: Text('Coming Soon')),
        ],
      ),
    );
  }
}
