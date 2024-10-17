import 'package:flutter/material.dart';
import 'package:quizapp/question_screen.dart';
import 'package:quizapp/result_screen.dart';
import 'package:quizapp/start_screen.dart';
import 'package:quizapp/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  List<String> chooseAnswers = [];

  @override
  void initState() {
    activeScreen = StrtScreen(switchScreen);
    super.initState();
  }

  void addAnswer(String answer) {
    chooseAnswers.add(answer);
    if (chooseAnswers.length == quetions.length) {
      setState(() {
        // chooseAnswers = [];
        activeScreen = ResultScreen(
            chooseAnswers: chooseAnswers, restartQuiz: restartQuiz);
      });
    }
  }

  void switchScreen() {
    setState(
      () {
        activeScreen = QuestionScreen(addAnswer: addAnswer);
      },
    );
  }

  void restartQuiz() {
    setState(
      () {
        chooseAnswers = [];
        activeScreen = QuestionScreen(addAnswer: addAnswer);
      },
    );
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.grey,
                Colors.blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
