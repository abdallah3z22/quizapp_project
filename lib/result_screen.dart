import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/summary_questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chooseAnswers, required this.restartQuiz});

  final List<String> chooseAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < quetions.length; i++) {
      summaryData.add(
        {
          'question_index': i,
          'question': quetions[i].text,
          'correct_answer': quetions[i].answers[0],
          'user_answer': chooseAnswers[i]
        },
      );
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();
    var questionNumber = quetions.length;
    var correctAnswerslength = summaryData.where((question) {
      return question["correct_answer"] == question["user_answer"];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "you have $correctAnswerslength of  $questionNumber questions correct",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SummaryQuestions(summaryData: getSummaryData()),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.arrow_back),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('restart quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
