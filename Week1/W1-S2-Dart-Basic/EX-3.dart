void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code

  // Using where method in dart
  var passedStudents = scores.where((score)=> score >= 50);
  print(passedStudents);
  print('${passedStudents.length} students passed.');

  // Using simple algorithm
  List<int> resultPassed = [];
  for(int score in scores){
    if(score >= 50){
      resultPassed.add(score);
    }
  }
  print(resultPassed);
  print('${resultPassed.length} students passed.');
}