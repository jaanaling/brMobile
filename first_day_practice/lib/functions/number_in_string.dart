class NumberInString {
  static List<num> findNumbersInString(String input) {
    final List<num> numbers = [];

    final RegExp regExp = RegExp(r'\b\d+(\.\d+)?\b');
    final matches = regExp.allMatches(input);

    for (final match in matches) {
      final String matchStr = match.group(0)!;
      numbers.add(num.parse(matchStr));
    }

    return numbers;
  }
}
