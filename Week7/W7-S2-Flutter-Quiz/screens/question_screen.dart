import 'package:flutter/material.dart';

import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    required this.question,
    super.key,
    required this.onTap,
  });

  final Question question;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Ensure scrollability
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            question.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...question.possibleAnswers.map((answer) {
            return Container(
              margin: const EdgeInsets.fromLTRB(30, 5, 30, 10),
              padding: const EdgeInsets.all(5),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blue[300],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () => onTap(answer),
                child: Text(
                  answer,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
