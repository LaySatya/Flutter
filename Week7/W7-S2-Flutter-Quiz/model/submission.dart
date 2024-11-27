import 'package:flutter_course/Course/Week7/W7-S2-Flutter-Quiz/model/quiz.dart';

class Answer {
  final String questionTitle;
  final String questionAnswer;
  final bool isCorrect;
  final String correctAnswer;

  Answer({
    required this.questionTitle,
    required this.questionAnswer,
    required this.isCorrect,
    required this.correctAnswer, 
  });
}

class Submission {
  final List<Answer> answers = [];

  void addAnswer(Question question, String selectedAnswer) {
    answers.add(
      Answer(
        questionTitle: question.title,
        questionAnswer: selectedAnswer,
        isCorrect: selectedAnswer == question.goodAnswer,
        correctAnswer: question.goodAnswer,
      ),
    );
  }

  void removeAnswers() {
    answers.clear();
  }

  int getScore() {
    return answers.where((answer) => answer.isCorrect).length;
  }
}
