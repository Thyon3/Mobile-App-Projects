import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.questionSummary});

  List<Map<String, Object>>
      questionSummary; //we are using another screen to print the summary which contains the question that is asked the real correct answre of the question the index of the question and also the user answer for the
  // question or simply the contents of the map that we built at the results_screen.dart file so we will simply pass the map tha we have created there

  Widget build(context) {
    return SizedBox(
      height:
          300, //we want to give the column of the final question summary screen a fixed height so that we can scroll to see the cutted content
      //to make the column widget scrollable we have to wrap it with another widget also whcih called
      child: SingleChildScrollView(
        child: Column(
          children: questionSummary.map((data) {
            //here we are using the map function on questionSummary a map data structure to change its contents to a list of widgets that is why we are returning the row(children: [])
            return Row(children: [
              //now data is changed to a list so we can access its elements using the square brackets like this
              Text(((data['questions_index'] as int? ?? 0) + 1).toString()),
              //we are accessing the value at key questions_index and type casting it to an integer  value then adding one since it is an index and also we have to change it to string cause the text widget only accepts a string as a parameter
              Column(
                children: [
                  Text((data['questions']).toString()),
                  SizedBox(
                    height: 5,
                  ),
                  Text((data['user_answer'] as String)),
                  SizedBox(height: 5),
                  Text((data['correct_answer'] as String))
                ],
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
