class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers); // copy the list
    shuffledList
        .shuffle(); // shuffle alters the original list; works with final since shuffle doesn't assign a new list to the variable, it only alters the already present list in the variable
    return shuffledList;
  }
}
