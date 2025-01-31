import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function()
      startQuiz; //assingning the arguement that we accepted to the function variable startQuiz so now we can use it inside of this class every where

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/Images/image copy.png',
          width: 300,
        ),
        SizedBox(
          height: 40,
        ),
        Text('learn Flutter the fun way',
            style: GoogleFonts.libreBaskerville(
                color: Colors.black,
                fontSize: 45,
                fontWeight: FontWeight.w800)),
        SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          label: Text('Start Quiz'),
          icon: Icon(Icons.arrow_right_alt),
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black, backgroundColor: Colors.black),
        )
      ],
    ));
  }
}
