import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.lightBlueAccent,
          title: const Text(
            'EX-1',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.lightBlue,
        hoverColor: Colors.red,
        focusColor: Colors.pink,
        child: Icon(
          Icons.feedback,
          color: Colors.white,
        ),
      ),
      body: const Center(
        child: Text(
          'Hello my name is Satya.🤗❤️',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 30.5,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              letterSpacing: 3),
        ),
      ),
    )),
  );
}
