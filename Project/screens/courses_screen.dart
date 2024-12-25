import 'package:flutter/material.dart';

import '../models/courses.dart';
import '../widgets/courses_display.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Courses'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Iterate through the list of courses and display each one
              ...Courses.values.map(
                (course) => CourseDisplay(
                  courseTitle: course.label,
                  courseImage: course.courseImage,
                  courseCategories: course,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
