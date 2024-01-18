import 'package:flutter/material.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/resutl_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswer = [];
  var activeScreen = "start-screen";
  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

//method for store user selected answer,
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    print("Number of item stroed in list : ${selectedAnswer.length}");
    if (selectedAnswer.length == questions.length) {
      activeScreen = "result-screen";
    }
    setState(() {});
  }

  void restartQuiz() {
    //remove previous answer
    selectedAnswer.clear();
    //go to question screen
    activeScreen = "question-screen";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //screen navigation
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == "question-screen") {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chooseAnswer: selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
