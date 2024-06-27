import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStartQuiz});

  final Function() onStartQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: 0.8,
          child: Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Learn Flutter the fun way!',
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: onStartQuiz,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
          ),
          icon: const Icon(
            Icons.arrow_right_alt,
            color: Colors.white,
          ),
          label: Text(
            'Start Quiz',
            style: GoogleFonts.openSans(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
