import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'pdf_viewer_screen.dart'; // Make sure to create this file

class PdfListScreen extends StatefulWidget {
  final String subject;
  PdfListScreen({required this.subject});

  @override
  _PdfListScreenState createState() => _PdfListScreenState();
}

class _PdfListScreenState extends State<PdfListScreen> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<Map<String, dynamic>> files = [];

  @override
  void initState() {
    super.initState();
    listFiles(widget.subject);
  }

  Future listFiles(String subject) async {
    final ListResult result = await storage.ref(subject).listAll();
    final List<Map<String, dynamic>> files = result.items
        .map((e) => {
              "name": e.name,
              "path": e.fullPath,
            })
        .toList();

    setState(() {
      this.files = files;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Paper')),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(files[index]['name']),
            onTap: () async {
              String url =
                  await storage.ref(files[index]['path']).getDownloadURL();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PdfViewerScreen(url: url),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
