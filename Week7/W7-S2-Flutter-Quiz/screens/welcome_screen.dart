import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
 class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
      super.key,
      required this.quizTitle,
      required this.quizLogo,
      required this.onStart,
  });
  final String quizTitle;
  final String quizLogo;
  final VoidCallback onStart;
   
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
                width: 300,
                height: 300,
                quizLogo
              ),
              const SizedBox(height: 20),
              Text(
                quizTitle,
                style: const TextStyle(
                  color: Colors.white, 
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                'Start Quiz', 
                onTap: onStart,
                icon: Icons.arrow_right,
              )
      ],
    );
  }
}
 
