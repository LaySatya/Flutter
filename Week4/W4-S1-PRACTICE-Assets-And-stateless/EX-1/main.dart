import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;
  const HobbyCard({
      super.key,
      required this.title,
      required this.icon,
      this.backgroundColor = Colors.blue
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,   // the property backgroundColor
        ),
        child: Center(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Icon(
                  icon,         // the property icon
                  size: 25, 
                  color: Colors.white
                ),
              ),
              Text(
                title,    // the property title 
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "My Hobbies",
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey[500]
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                child:  HobbyCard(
                    title: 'Travelling',
                    icon: Icons.travel_explore,
                    backgroundColor: Colors.green,
                    
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: HobbyCard(
                  title: 'Skating',
                  icon: Icons.skateboarding,
                  backgroundColor: Colors.blue,
                )
              )
            ],
          ),
        ),
  )));
}
