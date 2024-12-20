import 'package:flutter/material.dart';

import '../data/videos_data.dart';
import '../models/courses.dart';
import '../screens/coursevideo_screen.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard({super.key});

  int videoAmount (String courseCategories){
    int videoAmount = videos.where((video) => video.course.label == courseCategories).length;
    return videoAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 35,
      runSpacing: 16,
      alignment: WrapAlignment.spaceBetween,
      children: Courses.values.map((course) {
        // final List<Videos> videos;
        return InkWell(
          hoverColor: Colors.white10,
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CourseVideosScreen(courseCategories: course),
            ),
          ),
          child: Container(
            width: 210, // Set a fixed width for each card
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  course.courseImage,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 8),
                Text(
                  course.label,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${videoAmount(course.label)} Videos',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
