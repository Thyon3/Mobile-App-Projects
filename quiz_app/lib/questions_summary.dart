import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary({super.key, required this.questionSummary});

  List<Map<String, Object>>
      questionSummary; //we are using another screen to print the summary which contains the question that is asked the real correct answre of the question the index of the question and also the user answer for the
  // question or simply the contents of the map that we built at the results_screen.dart file so we will simply pass the map tha we have created there

  Widget build(context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height:
            400, //we want to give the column of the final question summary screen a fixed height so that we can scroll to see the cutted content
        //to make the column widget scrollable we have to wrap it with another widget also whcih called
        child: SingleChildScrollView(
          child: Column(
            children: questionSummary.map((data) {
              //here we are using the map function on questionSummary a map data structure to change its contents to a list of widgets that is why we are returning the row(children: [])
              return Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(
                        right: 10), // Space between number and text
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      ((data['questions_index'] as int? ?? 0) + 1).toString(),
                      style: GoogleFonts.robotoMono(
                        color: Colors.amber,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  // Wrap Column inside Expanded
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align text to left
                      children: [
                        Text(
                          (data['questions']).toString(),
                          style: GoogleFonts.robotoMono(
                              fontSize: 17,
                              color: const Color.fromARGB(198, 0, 0, 0),
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'You Answered: ',
                              style: GoogleFonts.caveat(
                                  color: const Color.fromARGB(255, 2, 55, 99),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            Expanded(
                                child: Text(
                              data['user_answer'] as String,
                              style: GoogleFonts.spaceGrotesk(
                                  color: Colors.red, fontSize: 16),
                            ))
                          ],
                        ),
                        // User answer in red
                        SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              'Correct Answer: ',
                              style: GoogleFonts.caveat(
                                  color: const Color.fromARGB(255, 2, 55, 99),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            ),
                            Expanded(
                              child: Text(
                                data['correct_answer'] as String,
                                style: GoogleFonts.spaceGrotesk(
                                    color: const Color.fromARGB(255, 5, 95, 8),
                                    fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
