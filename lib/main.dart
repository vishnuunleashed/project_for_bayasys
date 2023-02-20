import 'package:bayasys/pages/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff01577b),
        secondaryHeaderColor: Colors.black.withOpacity(0.6)
      ),
      home: const LandingScreen(),
    );
  }
}
