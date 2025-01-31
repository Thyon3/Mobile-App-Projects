class QuizQuestions {
  const QuizQuestions(this.text, this.answers);
  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList; //the shuffle method updates the original list that it has been called on it does not return any value that is why we are returning the copid shuffledList
  }
}
