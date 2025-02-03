import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/quiz.dart';

class ResultsScreen extends StatelessWidget {
  void Function() restartQuiz;
  ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'questions_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData =
        getSummaryData(); //wer are using the summary data or the data returned by the summary data cause we want to know how much correct answres ddid the user answered
    final numTotalQuestions = questions
        .length; // the number of total questions is just the length of the questions

    // to know how much correct answers did the user answered we can use the logice that in the list of the summary data how many of the elements
    // have the same correct_answer and user_answer elements  cause summary data is a list of maps and each map contains a key and a value

    // for this purpose we can use the built in method called where

    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] ==
          data[
              'correct_answer']; //if the output is true then the result i mean whethre data['correct_answer'] or data['user_answer'] will be returned it means
      // they are going to be stored inside of the variable we have passed in but we need the number of correct questions or the length of the list so we will use .length at the end of the list
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have Answered $numCorrectQuestions Questions out of $numTotalQuestions',
              style: GoogleFonts.rowdies(fontSize: 20, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            QuestionsSummary(questionSummary: getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: restartQuiz,
                child: Text(
                  'Reastart Quiz!',
                  style: GoogleFonts.braahOne(
                      color: Colors.amber,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
