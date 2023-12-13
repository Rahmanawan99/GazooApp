import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Import the WelcomeScreen
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Make sure this import is correct

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter bindings are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Uses the correct platform options
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      // Set the home to WelcomeScreen instead of HomeScreen
      home: WelcomeScreen(), // Use WelcomeScreen as the starting widget
      debugShowCheckedModeBanner: false, // Optional: Hides the debug banner
    );
  }
}
