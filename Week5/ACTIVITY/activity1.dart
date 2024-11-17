import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 100),
              color: Colors.blue[900],
              height: 200,
          ),
          Column(
            children: [
              Container(
                height: 100,
                // color: Colors.green,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Container(
                      width: 100,
                      color: Colors.pink[300],
                    ),    
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 100,
                // color: Colors.yellow,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                      color: Colors.yellow,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                      color: Colors.yellow,
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                      color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.pink[300],
            ),
          )
        ],
      ),
    )
  ));
}