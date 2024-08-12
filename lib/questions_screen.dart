import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answers) onSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 110, 47, 146),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center, // centre the text within the widget
          ),
          const SizedBox(
            height: 30,
          ),
          ...currentQuestion.getShuffledAnswers().map(
            // map function runs the provided function on every element of the list (element being accessed with the name given in the parenthesis, in this case answer) in the order in which they appear in the list and returns an iterable (list) that contains the return value of this function in the order in which the functions are executed; the original list is not harmed
            (answer) {
              return AnswerButton(
                answerText: answer,
                onTap: answerQuestion,
              );
            }, // the three dots (spread operator) in front of an iterable or list convert the elements of the list into comma-separated values in the place the dots appear, the values coming in the order they appear in the list, and the last value being followed by a comma
          ),
        ],
      ),
    );
  }
}
