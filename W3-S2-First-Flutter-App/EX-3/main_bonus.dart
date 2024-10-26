import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "EX-3 Bonus",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[400]),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(30, 30, 30, 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[100]!,
                      Colors.blue[400]!,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                  child: Text(
                'OOP',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[300]!,
                      Colors.blue[600]!,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                  child: Text(
                'DART',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 15, 30, 0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue[400]!,
                      Colors.blue[900]!,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30)),
              child: const Center(
                  child: Text(
                'FLUTTER',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
            )
          ],
        ),
      ),
    ),
  ));
}
