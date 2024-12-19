import 'package:flutter/material.dart';

import '../data/videos_data.dart';
import '../models/courses.dart';
import '../widgets/courses_display.dart';
import './coursevideo_screen.dart';


class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

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
    return Material(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Courses'),
        ),
        // Add a floating action button to add new courses
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // const SizedBox(height: 20),
              // const Text(
              //   'Course',
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              // ),
              ...Courses.values.map(
                (course) => CourseDisplayScreen(
                  courseTitle: course.label,
                  courseImage: course.courseImage,
                  amountOfVideos: videos.length.toString(),
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
