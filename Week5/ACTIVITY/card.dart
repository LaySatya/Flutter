// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

const green1 = Color(0xff498869);
const green2 = Color(0xff5AA17F);

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: const Color(0xffEDE0E7),
      appBar: AppBar(
        backgroundColor: const Color(0xffEC5776),
        title: const Text(
          'Card Examples',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildNormalCard(), 
              buildImageCard(),
              buildExampadanbleCard(),
            ],
          ),
        ),
      ),
    )));

Widget buildNormalCard() => Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ronan OGOR',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'The best Flutter teacher',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
 
 
Widget buildImageCard() => Card(
    shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Ink.image(
            image: const NetworkImage(
              'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1327&q=80',
            ),
            height: 240,
            fit: BoxFit.cover,
            child: InkWell(
              onTap: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'The cat is the only domesticated species in the family Felidae and is often referred to as the domestic cat to distinguish it from the wild members of the family.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Buy Cat'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Buy Cat Food'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );


Widget buildExampadanbleCard() => Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            ExpansionTile(
              shape:  Border(),
              title: Text('This is a title'),
              subtitle: Text('This is a sub title'),
              children: [
                ListTile(title: Text('This is tile number 3')),
              ],
            )
          ],
        ),
      ),
    );