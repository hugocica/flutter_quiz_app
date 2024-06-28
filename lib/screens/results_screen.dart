import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/models/results_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.answers, required this.onRestart});

  final List<String> answers;
  final void Function() onRestart;

  List<ResultsSummary> get summaryData {
    final List<ResultsSummary> summary = [];

    for (var i = 0; i < answers.length; i++) {
      summary.add(ResultsSummary(
          i, questions[i].text, questions[i].answers[0], answers[i]));
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final totalCorrectAnswers = summaryData
        .where((data) => data.userAnswer == data.correctAnswer)
        .length;

    Widget buildSummaryItem(ResultsSummary data) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 30,
                height: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: (data.correctAnswer == data.userAnswer)
                      ? Colors.lightGreenAccent
                      : Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  (data.id + 1).toString(),
                  style: GoogleFonts.openSans(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.question,
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Correct Answer: ${data.correctAnswer}',
                      style: GoogleFonts.openSans(color: Colors.green),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Your Answer: ${data.userAnswer}',
                      style: GoogleFonts.openSans(
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered $totalCorrectAnswers out of $totalQuestions questions correctly!',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 450,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: summaryData.length,
                      padding: const EdgeInsets.all(0),
                      itemBuilder: (context, index) =>
                          buildSummaryItem(summaryData[index]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.white,
              ),
              onPressed: onRestart,
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.openSans(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
