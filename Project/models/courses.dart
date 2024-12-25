
enum Courses {
  mathematic('Mathematic', 'assets/FINAL-PROJECT-IMAGES/math.png'),
  english('English', 'assets/FINAL-PROJECT-IMAGES/english.jpg'),
  physic('Physic', 'assets/FINAL-PROJECT-IMAGES/physic.jpg'),
  chemistry('Chemistry', 'assets/FINAL-PROJECT-IMAGES/chemistry.jpg'),
  history('History', 'assets/FINAL-PROJECT-IMAGES/history.jpg');

  final String label;
  final String courseImage;
  const Courses(this.label, this.courseImage);
}