import 'package:flutter/material.dart';

import '../models/courses.dart';
import '../screens/coursevideo_screen.dart';


class CourseDisplayScreen extends StatelessWidget {
  const CourseDisplayScreen({
    super.key,
    required this.courseTitle,
    required this.courseImage,
    required this.amountOfVideos,
    required this.courseCategories,
  });
  final String courseTitle;
  final String courseImage;
  final String amountOfVideos;
  final Courses courseCategories;

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
              //  boxShadow: [
              //     BoxShadow(
              //       color: Colors.grey.withOpacity(0.2),
              //       blurRadius: 10,
              //       offset: const Offset(0, 4),
              //     ),
              //   ],
          ),
              // margin: const EdgeInsets.fromLTRB(20, 20 , 20 ,1),
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
                          '$amountOfVideos videos',
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