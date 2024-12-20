import 'package:flutter/material.dart';
import './app.dart';
String joyLogo = 'assets/FINAL-PROJECT-IMAGES/joy-logo.png';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 147, 229, 250),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 51, 54, 56),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 51, 54, 56),
      ),
    home: JoyLearningApp(logo: joyLogo),
  ));
}
