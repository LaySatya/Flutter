import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
  });

  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    int score = submission.getScore();

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'You answered $score out of ${quiz.questions.length}!',
            style: const TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Your score: ${(score * 100 / quiz.questions.length).toStringAsFixed(2)}%',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
         SingleChildScrollView(
                child: Column(
                  children: submission.answers.map((a) {
                    return Card(
                      color: a.isCorrect ? Colors.green[200] : Colors.red[200], // Green for correct, Red for incorrect
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: ListTile(
                        title: Text(
                          a.questionTitle, // Display question title
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        subtitle: Text(
                          'Your Answer: ${a.questionAnswer}\nRight answer: ${a.correctAnswer}', // Display the answer
                          style: const TextStyle(color: Colors.black),
                        ),
                        trailing: Icon(
                          a.isCorrect ? Icons.check_circle : Icons.cancel, // Icon for correct or incorrect
                          color: a.isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                    );
                  }).toList(),
                ),
         ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              backgroundColor: Colors.blueAccent,
              textStyle: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
