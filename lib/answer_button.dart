import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key,
      required this.answerText,
      required this.onTap}); // name of the arguments will also be onTap and answerText

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 10,
            ),
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
