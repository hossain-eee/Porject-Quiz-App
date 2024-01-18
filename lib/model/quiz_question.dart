class QuizQuestion {
  final String text;
  final List<String> answers;
  QuizQuestion(this.text, this.answers);
  List<String> get shuffledAnswer {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
