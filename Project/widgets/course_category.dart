import 'package:flutter/material.dart';

import '../data/videos_data.dart';
import '../models/courses.dart';
import '../screens/coursevideo_screen.dart';

class CoursesCard extends StatelessWidget {
  const CoursesCard({
    super.key,
    required this.courseTitle,
    required this.courseImage,
    required this.courseCategories,
  });

  final String courseTitle;
  final String courseImage;
  final Courses courseCategories;

  // Getter to get the amount of videos each course has
  int get videoAmount {
    final matchingVideos = videos.where((video) {
      return video.course == courseCategories;
    }).toList();
    return matchingVideos.length;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 1),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CourseVideosScreen(
              courseCategories: courseCategories,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              width: 2,
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  courseImage,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        courseTitle,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        '${videoAmount} videos',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
