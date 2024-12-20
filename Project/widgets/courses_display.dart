import 'package:flutter/material.dart';
import 'package:flutter_course/Course/Final-Project/data/videos.dart';

import '../models/courses.dart';
import '../screens/coursevideo_screen.dart';


class CourseDisplay extends StatelessWidget {
  const CourseDisplay({
    super.key,
    required this.courseTitle,
    required this.courseImage,
    required this.courseCategories,
  });
  final String courseTitle;
  final String courseImage;
  final Courses courseCategories;


  // getter to get amount of videos
  int get videoAmount {
    int videosAmountByCourses = videos.where((video) => video.course.label == courseCategories.label).length;
    return videosAmountByCourses;
  }
 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20 , 20 ,1),
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
              border: Border.all(width: 2, color: Colors.grey.withOpacity(0.2)),
          ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      height: 100,
                      courseImage
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      children: [
                        Text(
                          courseTitle,
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          '$videoAmount videos',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    )
                  ],
                )
              ),
            ),
      ),
    );
  }
}