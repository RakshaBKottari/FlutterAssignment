
import 'package:flutter/material.dart';
import 'question.dart';

class QuizResultScreen extends StatelessWidget {
  final int totalRight;
  final int wrongQ;

    const QuizResultScreen(
        { super.key,
            required this.totalRight,
            required this.wrongQ,
            });

    @override
  Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                centerTitle: true,
                title: const Text("Your Result"),
      ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text(
                  "Total Right Answers : $totalRight",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
              Text(
                  "Total Wrong Answers : $wrongQ",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
        
            //button
              ElevatedButton(
                  onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const QuizScreen(),
                    ),
                          (Route < dynamic > route) => false);
                  },
                  child: const Text("Start Quiz Again"),
            )
          ],
              ),
        ),
    );
    }
}