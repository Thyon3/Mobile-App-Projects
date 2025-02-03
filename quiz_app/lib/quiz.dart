import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Widget? activeScreen; // we can assign widgets inside of a variable
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      //activeScreen = QuestionsScreen();
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    // now after showing all the questions we have to stop when all the questions are answered and display hte final screen we can do that by comparing the size of selectedAnswers with Questions

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers =
        //     []; // once the length of selectedAnswers and Questions is equal we have to reset the selectedAnswers list to empty list cause we are restarting the app and no question is answered
        activeScreen =
            'result-screen'; //after all the questions are answered then the results screen will be shown
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers.clear();
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(
        switchScreen); //we are passing switchScreen ot startScreen because startScreen is using hte function switchScreen inside of it
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      ); // we will pass  chooseAnswer ot QuestionScreen cause QuestionScreen will use the fuction chooseAnswer inside of it
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      ); //passing the resultsScreen() to screen widget to show the results screen when all the questions are answerd
      //and also we ar passing the list of selected answers to a variable called chosen answers inside of the resultsscreen cause resultscren is going to use it
    }
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leadingWidth: 300,
              leading: Text(
                'Quiz App',
                style: GoogleFonts.comingSoon(
                  color: Colors.amber,
                  backgroundColor: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(257, 77, 14, 151),
                  Color.fromARGB(257, 77, 14, 151),
                  Color.fromARGB(1, 130, 151, 14)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              child: screenWidget,
            )));
  }
}
