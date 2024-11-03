import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          title: Text(
            'EX-2',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Container(
          // padding: EdgeInsets.all(30),
          margin: const EdgeInsets.all(35),
          decoration: BoxDecoration(color: Colors.blue[300]),
          child: Container(
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(20)),
            child: const Center(
              child: Text(
                'CADT STUDENTS',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      // List of students goes here...
    ),
  );
}
