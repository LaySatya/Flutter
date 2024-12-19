import './courses.dart';


class Videos{
  final String id;
  final String videoUrl;
  final String title;
  final String description;
  final Courses course;

  Videos({
    required this.id,
    required this.videoUrl,
    required this.title,
    required this.description,
    required this.course,
  });
}
