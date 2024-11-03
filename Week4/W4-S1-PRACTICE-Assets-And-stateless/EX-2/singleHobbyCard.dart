import 'package:flutter/material.dart';

const String dartImage = 'assets/W4-S1-Assets-Stateless-Widget/dart.png';
const String firebaseImage = 'assets/W4-S1-Assets-Stateless-Widget/firebase.png';
const String flutterImage = 'assets/W4-S1-Assets-Stateless-Widget/flutter.png';

void main(){
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: Colors.white,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 0, 2),
                    child: Image(
                      image: AssetImage(dartImage),
                      width: 100,
                      height: 100,
                    ),

                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Text(
                      'Dart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 12),
                    child: Text(
                      'The best object language'
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )
  ));
}