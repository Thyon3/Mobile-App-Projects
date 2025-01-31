import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionScreenState = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionScreenState += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionScreenState];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // used to make all the elements in side of the children list to strech horizontally or take all the available width
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  // suing google fonts we just have to say GoogleFonts.Name of the font we want to use
                  color: Colors.red,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign
                  .center, //centers the texts at the middle of the container
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  answer, //the map function is used to change all the elements of the list to another type here from answer to AnswerWidget(answer, (){}) so that evey choice would have a button
                  () {
                answerQuestion(answer);
              }); //we are using the spread operator to separate each value returned by the map int o single values cause children wants only single widgets not another list
            })
          ],
        ),
      ),
    );
  }
}
