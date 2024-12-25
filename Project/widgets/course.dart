import 'package:flutter/material.dart';
import '../models/courses.dart';
import '../screens/coursevideo_screen.dart';
import './courses_display.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  void onTap(Courses courseCategory, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CourseVideosScreen(courseCategories: courseCategory),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Courses',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          ...Courses.values.map(
            (course) => CourseDisplay(
              courseTitle: course.label,
              courseImage: course.courseImage,
              courseCategories: course,
            ),
          ),
        ],
      ),
    );
  }
}
