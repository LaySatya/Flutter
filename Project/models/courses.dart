
enum Courses {
  mathematic('Mathematic', 'assets/FINAL-PROJECT-IMAGES/math.png'),
  english('English', 'assets/FINAL-PROJECT-IMAGES/english.jpg'),
  dart('Dart', 'assets/FINAL-PROJECT-IMAGES/flutter.png'),;

  final String label;
  final String courseImage;
  const Courses(this.label, this.courseImage);
}