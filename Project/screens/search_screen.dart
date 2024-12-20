import 'package:flutter/material.dart';
import 'package:flutter_course/Course/Project/models/courses.dart';

import '../widgets/search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  List<Courses> filteredCourses = [];

  void _performSearch(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredCourses = [];  // show all courses when no query is provided
      } else {
        // filter courses based on query
        filteredCourses = Courses.values
            .where((course) =>
                course.label.toLowerCase().contains(query.toLowerCase()))
            .toList(); 
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search Courses',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: SearchTextField(onSearch: _performSearch)),
          const SizedBox(height: 30),
          filteredCourses.isNotEmpty ? Expanded(
            child: ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                final course = filteredCourses[index];
                return Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 1),
            child: InkWell(
              // onTap: () => Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => CourseVideosScreen(
              //       courseCategories: C,
              //     ),
              //   ),
              // ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10.0),
                  border:
                      Border.all(width: 2, color: Colors.grey.withOpacity(0.2)),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Image.asset(
                          course.courseImage,
                          height: 100
                        ),
                        const SizedBox(width: 8.0),
                        Column(
                          children: [
                            Text(
                              course.label,
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              '5 videos',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          );
              }
            )
          ) : const Expanded(
            child: Center(
              child: Text(
                'No courses found',
                style: TextStyle(color: Colors.white),
              ),
            )
          )
        ],
      ),
    );
  }
}
