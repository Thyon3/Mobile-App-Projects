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
        Container(
          margin: EdgeInsets.all(10),
          child: Text('?Wanna A Quiz?',
              style: GoogleFonts.libreBaskerville(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.w800,
              )),
        ),
        SizedBox(
          height: 20,
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          label: Text(
            'Start Quiz',
            style: GoogleFonts.spectral(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          icon: Icon(Icons.arrow_right_alt),
          style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 142, 86, 86),
              backgroundColor: Colors.black),
        )
      ],
    ));
  }
}
