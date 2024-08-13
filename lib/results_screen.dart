import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    // since every type in dart is of type object, using Object as data type allows to store all kinds of data types and values
    // Map is a data structure consisting of key-value pairs; type of key is specified first, then of value

    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      // loop body
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final int numTotalQuestions = questions.length;
    /* final int numCorrectQuestions = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length; // where () does not change the original list, returns a new iterable; return true for the data point you want to keep in this new iterable and false for those you don't; length also exists on iterables */

    // If you have an anonymous function which might take some input values and immediately returns some modified value of the input value (or some other value) and performs no other operation, like above, it could be changed into an arrow function like:

    final int numCorrectQuestions = summaryData.where(
      (data) => data ['user_answer'] == data ['correct_answer'];
    ).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 230, 200, 253),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Lists of answers and questions'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}


/* 

Just as you can use the if keyword inside of lists (to add elements conditionally), you can also use the
for keyword to add multiple items to a list:

final numbers = [5 ,6];
final myList = [
1, 2, for (final num in numbers) num
];

In this example, the numbers 5 and 6 will be added to myList (hence myList thereafter is [1, 2, 5, 6]).

This for ... in syntax is a special variation of the for loop through multiple items in a list. The idea behing this loop is to simplify the process
of performing some operation on all items in a list.

Whem used in a list, it's essentially an alternative to the spread operator (...):

final numbers = [5, 6];
final myList = [
1,
2,
...numbers
]

It can be useful in scenarios where values must be transformed before being added to a list- the for ... in loop can then be
used instead of map () + spread operator:

final numbers = [5, 6];
final myList = [
1,
2,
...numbers.map ((n) {return n * 2}) // adds 10 and 12
];

can be replaced with:

final numbers = [5, 6];
final myList = [
1,
2,
for (final num in numbers) num * 2 // adds 10 and 12
]

*/