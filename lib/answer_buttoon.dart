import 'package:flutter/material.dart';

class AnswerButtoon extends StatelessWidget {
  const AnswerButtoon(this.answer, this.chooseQuestion, {super.key});

  final String answer;
  final void Function() chooseQuestion;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        chooseQuestion();
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: Colors.black45,
        foregroundColor: Colors.white,
      ),
      child: Text(answer),
    );
  }
}
