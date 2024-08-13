import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
/* 

  Container(
      padding: const EdgeInsets.all(40),
      height: 300,
      child: SizedBox(
        child: SingleChildScrollView(
          // it takes a single child and makes it scrollable if that child exceeds the boundary set around it by it's parent widgets (in this case, sized box limits the column widget to height 300, but since it takes more space, it becomes scrollable now)
          child: Column(
            children: summaryData.map((data) {
              return Row(
                children: [
                  Text(
                    ((data['question_index'] as int) + 1)
                        .toString(), // since the values are of type object, typecasting is required to tell flutter what type it is
                  ),
                  Expanded(
                    // expanded creates a widget that expands the child of a row or column widget to take up all the available space in the main axis of the parent widget; in this case, it will restrict the child column to not go beyond the screen boundary (width of the parent row widget)
                    child: Column(
                      // This column, without being wrapped with Expanded, takes up infinite width of it's parent row widget, doesn't matter if stuff is cut off from main screen
                      children: [
                        Text(data['questions'] as String),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String),
                        Text(data['correct_answer'] as String),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(), // toList () converts the iterable returned by map () into a list
          ),
        ),
      ),
    );
*/