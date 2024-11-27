import 'package:flutter/material.dart';

import 'model/quiz.dart';
import 'quiz_app.dart';

void main() {

  // Question class in the main/quiz.dart file
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');
  Question q3= const Question(
      title: "Which is dart`s framework?",
      possibleAnswers: ["laravel", "flutter", 'react'],
      goodAnswer: 'flutter');

  // put it to the list and give it to the Quiz class constructor
  List<Question> myQuestions = [q1, q2, q3];
  Quiz myQuiz = Quiz(title: "Crazy Quiz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}
