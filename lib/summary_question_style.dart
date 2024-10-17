import 'package:flutter/material.dart';

class SummaryQuestionStyle extends StatelessWidget {
  const SummaryQuestionStyle({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.black45,
        fontSize: 22,
      ),
    );
  }
}
