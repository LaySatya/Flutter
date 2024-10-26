import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: Text(
        'EX-3 ✔️',
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
    ),
    body: Container(
      decoration: BoxDecoration(color: Colors.grey[400]),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
                child: Text(
              'OOP',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
                child: Text(
              'Dart',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
                child: Text(
              'FLUTTER',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            )),
          )
        ],
      ),
    ),
  )));
}
