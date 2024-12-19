import 'package:flutter/material.dart';

import './screens/home_screen.dart';
// import 'package:flutter_course/Course/Final-Project/screens/wholeapp.dart';
// import 'package:flutter_course/Course/Final-Project/widgets/button.dart';
import './widgets/button.dart';

class JoyLearningApp extends StatelessWidget {
  const JoyLearningApp({super.key, required this.logo});
  final String logo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          children: [
            // logo
            Image.asset(width: 400, height: 400, logo),
            const Text(
              'Welcome back!',
              style: TextStyle(fontSize: 30.0, color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              'Enjoy learning with joy!',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            // button
            const SizedBox(height: 30),
            Button(
              textColor: Colors.white,
              borderRadius: 3,
              bgColor: Colors.white60,
              buttonText: "EXPLORE COURSES",
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.all(30),
              buttonWidth: 400,
              haveBorder: true,
              actions: ()  {
                // showDialog(
                //     context: context,
                //     builder: (context) {
                //       return const Center(child: CircularProgressIndicator());
                //     });
                // await Future.delayed(const Duration(seconds: 1));
                Navigator.of(context).pop();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(appLogo: logo)));
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
