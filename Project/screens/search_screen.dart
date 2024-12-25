import 'package:flutter/material.dart';
import 'package:flutter_course/Course/Project/models/courses.dart';
import 'package:flutter_course/Course/Project/widgets/courses_display.dart';
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
        filteredCourses = [];
      } else {
        // Filter courses based on the search query
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
            child: SearchTextField(onSearch: _performSearch),
          ),
          const SizedBox(height: 30),
          filteredCourses.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      return CourseDisplay(
                        courseTitle: course.label,
                        courseImage: course.courseImage,
                        courseCategories: course,
                      );
                    },
                  ),
                )
              : const Expanded(
                  child: Center(
                    child: Text(
                      'No courses found',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
