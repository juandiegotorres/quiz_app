import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    switch (activeScreen) {
      case 'questions-screen':
        screenWidget = QuestionScreen(choosenAnswer);
        break;
      case 'result-screen':
        screenWidget = ResultScreen(selectedAnswers, restartQuiz);
        selectedAnswers = [];
        break;
      default:
        screenWidget = StartScreen(switchScreen);
    }

    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.josefinSansTextTheme(),
      ),
      title: 'Quiz App',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 151, 162, 28),
        body: screenWidget,
      ),
    );
  }
}
