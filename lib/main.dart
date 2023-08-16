import 'package:flutter/material.dart';
import 'question.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 223, 99, 99)),
        useMaterial3: true,
      ),
      home: const QuizScreen(),
    );
  }
}