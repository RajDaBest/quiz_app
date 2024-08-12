import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.onSwitchBackToStartScreen});

  final void Function() onSwitchBackToStartScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('You answered X out of Y questions correctly!'),
          const SizedBox(
            height: 30,
          ),
          const Text('Lists of answers and questions'),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: onSwitchBackToStartScreen,
            child: const Text('Restart Quiz!'),
          ),
        ],
      ),
    );
  }
}
