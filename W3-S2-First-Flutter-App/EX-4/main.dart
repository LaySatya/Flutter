import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Color start;
  final Color end;
  
  const CustomCard({super.key, this.text = 'hello', this.color, required this.start, required this.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [start, end],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          'EX-4',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        
        children: [
          CustomCard(text: 'OOP', start: Colors.blueAccent, end: Colors.purple),
          CustomCard(text: 'DART', start: Colors.green, end: Colors.lightGreen),
          CustomCard(text: 'FLUTTER', start: Colors.purple, end: Colors.orange),
        ],
      ),
    ),
  ));
}
