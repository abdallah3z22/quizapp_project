import 'package:flutter/material.dart';
import 'package:quizapp/summary_question_style.dart';

class SummaryQuestions extends StatelessWidget {
  const SummaryQuestions({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((elemet) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //textalign: TextAlignment.center,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      ((elemet['question_index'] as int) + 1).toString(),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SummaryQuestionStyle(
                          text: elemet["question"] as String,
                        ),
                        SummaryQuestionStyle(
                          text: elemet["correct_answer"] as String,
                        ),
                        SummaryQuestionStyle(
                          text: elemet["user_answer"] as String,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
