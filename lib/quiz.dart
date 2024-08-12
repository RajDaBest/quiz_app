import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  int activeScreen = 0;
/*   Widget? activeScreen;

   @override
  void initState() {
    // this function is run after the object has been created (with all its variables and methods) and before build is called
    activeScreen = StartScreen(
        switchScreen); // using var would make the variable of the type of StartScreen () object, which is StartScreen
    super.initState();
  } // provided by State<> */

  void switchScreen() {
    setState(() {
      activeScreen = 1;
    });
  }

  void switchBackToStart() {
    setState(() {
      activeScreen = 0;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer); // append to the list

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 2;
        selectedAnswers.clear();
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 1) {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 2) {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
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
          child: screenWidget,
        ),
      ),
    );
  }
}

/*

Every flutter widget has a built-in lifecycle: a collection of methods that are automatically executed by Flutter (at certain points of time).

There are three extremely important (stateful) widget lifecycle methods you should be aware of:

1. initState (): Executed by Flutter when the StatefulWidget's State object is initialized
2. build (): Executed by Flutter when the Widget is built for the first time AND after setState () was called
3. dispose (): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)

*/

/* 

In Dart, you may also use if inside of lists to conditionally add items to lists:

final myList = [1, 2, if (condition) 3];

In this example, the number 3 will only be added to myList if condition was trie (condition is a boolean value). 

Please note that there are NO curly braces around the if statement body. The if statement body also only comprises the next line of code (i.e, you can't have multiple
lines of code inside the if statement). 

You can also specify an else case - an alternative value that may be inserted into the list if condition is not true (i.e, it is false):class

final myList = [1, 2, if (condition) 3 else 4];

Using this feature is optional. Alternatively, you could, for example, also work with a ternary expression:class

final myList = [1, 2, condition ? 3 : 4];

Especially when inserting more complex values (e.g., a widget with multiple parameters being set) into a more complex list (e.g., a list of widgets passed to Column ()
or Row ()), this feature can lead to more readable code.

*/
