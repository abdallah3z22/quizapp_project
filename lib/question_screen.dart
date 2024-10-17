import 'package:flutter/material.dart';
import 'package:quizapp/answer_buttoon.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.addAnswer});

  final void Function(String answer) addAnswer;
  @override
  State<QuestionScreen> createState() {
    return QuestionScreenState();
  }
}

class QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  chooseQuestion(answer) {
    widget.addAnswer(answer);
    setState(() {
      //currentQuestionIndex = currentQuestionIndex + 1;
      //currentQuestionIndex+=1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    var currentQuestion = quetions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.answers.map((answer) {
              return AnswerButtoon(answer, () {
                chooseQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
