import 'package:quiz_app/Models/quiz_questions.dart';

const questions = [
  QuizQuestions('what iare the main building blocks of Flutter UIs? ',
      ['Widgets', 'Components', 'Blocks', 'Functions']),
  QuizQuestions('How are Flutter Uis built?', [
    'By combining widgets in code',
    'By combining widgets in a visual editor',
    'By difining widgets in config files',
    'By using XCode for Ios and Android studio for Android'
  ]),
  QuizQuestions('What is the purpose of a Stateful widget?', [
    'Update UI as data changes',
    'Update data as Ui changes',
    'Ignore data cahnges',
    'Tender UI that does not depend on data '
  ]),
  QuizQuestions(
      'Which widget should you try to use more often Stateless widget or stateful widget?',
      [
        'stateless widget',
        'stateful widget',
        'both are equally good ',
        'none of the above'
      ]),
  QuizQuestions('What happens if you change data in a stateless widget?', [
    'the ui is not updated',
    'the Ui is updated',
    'the closes statefulwidget is updated',
    'any nested stateful widget are updated'
  ]),
  QuizQuestions('how should you update data inside of stateful widget?', [
    'by calling setstate()',
    'by calling updatedata()',
    'by calling updateUI()',
    'By calling updatestate()'
  ])
];
