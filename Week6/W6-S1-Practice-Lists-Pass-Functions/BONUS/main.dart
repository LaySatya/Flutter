import 'package:flutter/material.dart';

import './screen/temperature.dart';
import './screen/welcome.dart';
// import 'package:test1/W5-S2-List-Inputs/1%20-%20START%20CODE/EXERCISE-3/screen/welcome.dart';

class TemperatureApp extends StatefulWidget {
  
  const TemperatureApp({super.key});
  
  @override
  State<TemperatureApp> createState() {
    
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  bool isWelcomePage = true;
  
  // change screen
  void changePage(){
    setState(() {
      isWelcomePage = !isWelcomePage;
    });
  }
  @override
  Widget build(context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isWelcomePage ? Welcome(switchPage: changePage) : Temperature(switchpage: changePage,),
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}