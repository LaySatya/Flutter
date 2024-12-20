import 'package:flutter/material.dart';
import '../data/videos_data.dart';
import '../models/courses.dart';
import '../screens/coursevideo_screen.dart';
import './courses_display.dart';



class Course extends StatelessWidget {
  const Course({super.key});

  void onTap(Courses courseCategory, BuildContext context) {
    // Navigate to the course details screen with the selected course
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
          // const SizedBox(height: 20),
          const Text(
            'Course',
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
