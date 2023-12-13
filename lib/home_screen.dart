import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<String> pdfUrl;

  @override
  void initState() {
    super.initState();
    // Initialize the PDF URL
    pdfUrl = getPdfUrl();
  }

Future<String> getPdfUrl() async {
  // Corrected reference path
  String path = '5070/2002/Winter/Past Paper/5070_w02_qp_1.pdf';
  String url = await FirebaseStorage.instance
      .ref(path) // Use the relative path
      .getDownloadURL();
  return url;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View PDF'),
      ),
      body: FutureBuilder<String>(
        future: pdfUrl,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              // Display the PDF from the URL
              return SfPdfViewer.network(snapshot.data!);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading PDF: ${snapshot.error}'));
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
