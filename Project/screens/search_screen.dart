import 'package:flutter/material.dart';

import '../widgets/search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        // resizeToAvoidBottomInset: false, // To avoid the keyboard covering the search bar.
        appBar: AppBar(
          // backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Search Courses',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SearchTextField()
        ),
    );
  }
}