import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            Container(
              // margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
              ))),
              child: Row(
                children: [
                  const Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "title",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "description",
                      )
                    ],
                  )),
                  IconButton(
                      onPressed: () => {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
