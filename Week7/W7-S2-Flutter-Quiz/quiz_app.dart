// import 'dart:ffi';
import 'package:flutter/material.dart';

import './model/submission.dart';
import './screens/question_screen.dart';
import './screens/result_screen.dart';
import './screens/welcome_screen.dart';
import 'model/quiz.dart';

String logo = "assets/W7-S1-Quiz-App/quiz-logo.png";
Color appColor = Colors.blue[500] as Color;

enum QuizState {
  notStarted,
  started,
  finished
}


class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});
  final Quiz quiz;
  
  // final Question questions;

  @override
  State<QuizApp> createState() => _QuizAppState();

}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  int currentQuestionIndex = 0; 
  int score = 0;
  Submission submission = Submission();

  final List<QuizState> states = [
    QuizState.notStarted,
    QuizState.started,
    QuizState.finished,
  ];

  void changeScreenState(){
    setState(() {
      final currentState = states.indexOf(quizState);
      quizState = states[(currentState + 1) % states.length]; 
    });
  }
 void handleAnswerSubmission(String selectedAnswer) {
  if (quizState == QuizState.started) {
    var currentQuestion = widget.quiz.questions[currentQuestionIndex];
    submission.addAnswer(currentQuestion, selectedAnswer);

    if (currentQuestionIndex < widget.quiz.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        quizState = QuizState.finished;
      });
    }
  }
}

  void restartQuiz() {
      currentQuestionIndex = 0;
      score = 0;
    setState(() {
      submission.removeAnswers(); // Clear previous answers
      quizState = QuizState.notStarted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if(quizState == QuizState.notStarted) 
                WelcomeScreen(quizTitle: 'Crazy Quiz', quizLogo: logo, onStart: changeScreenState),
              if(quizState == QuizState.started)
                 QuestionScreen(question: widget.quiz.questions[currentQuestionIndex] ,onTap: handleAnswerSubmission),
              if(quizState == QuizState.finished)
                ResultScreen(onRestart: restartQuiz, submission: submission, quiz: widget.quiz)
            ],
          ),
        ),
      ),
    );
  }
}
