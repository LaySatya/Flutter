import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: Text(
      //     'My Hobbies',
      //     style: TextStyle(
      //         fontSize: 25,
      //         color: Colors.grey[700]
      //     ),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,   // the property backgroundColor
        ),
        child: const Center(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Icon(
                  Icons.travel_explore,         // the property icon
                  size: 25, 
                  color: Colors.white
                ),
              ),
              Text(
                'Travelling',    // the property title 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ))
          ],
        ),
      ),
    )
  ));
}