import 'package:flutter/material.dart';

List<int> num = [
  1,
  2,
  3,
  4,
  5,
];

void main(){
  runApp(MaterialApp(
    home:  Scaffold(
      body: Column(
        children: [
          ...num.map((i) => Text("$i")),
          // Text(num[i].toString()),
        ],
      )
    ),
  ));
}