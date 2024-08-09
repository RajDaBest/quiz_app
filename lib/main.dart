import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';

void buttonPress() {}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purpleAccent,
              ],
            ),
          ),
          child: const StartScreen(),
        ),
      ),
    ),
  );
}
