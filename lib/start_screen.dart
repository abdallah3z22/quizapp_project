import 'package:flutter/material.dart';

class StrtScreen extends StatelessWidget {
  const StrtScreen(this.switchScreen, {super.key});

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/problem.png',
            width: 300,
            color: const Color.fromARGB(100, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Lest Learn Fultter, Start Quiz',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black87,
            ),
            onPressed: switchScreen,
            label: const Text(
              'start Quiz',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
