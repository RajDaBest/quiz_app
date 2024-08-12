import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summaryData.map((data) {
        return Row(
          children: [
            Text(
              ((data['question_ index'] as int) + 1)
                  .toString(), // since the values are of type object, typecasting is required to tell flutter what type it is
            ),
            Column(
              children: [
                Text(data['question'] as String),
                const SizedBox(
                  height: 5,
                ),
                Text(data['user-answer'] as String),
                Text(data['correct_answer'] as String),
              ],
            ),
          ],
        );
      }).toList(), // toList () converts the iterable returned by map () into a list
    );
  }
}
