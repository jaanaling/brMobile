class ExtractUniqueDigits {
  static List<int> extractUniqueDigits(String input) {
    final Set<int> uniqueDigits = <int>{};

    final Map<String, int> wordToDigit = {
      'zero': 0,
      'one': 1,
      'two': 2,
      'three': 3,
      'four': 4,
      'five': 5,
      'six': 6,
      'seven': 7,
      'eight': 8,
      'nine': 9,
    };

    final List<String> words = input.replaceAll(',', '').split(' ');

    for (final String word in words) {
      if (wordToDigit.containsKey(word)) {
        uniqueDigits.add(wordToDigit[word] ?? 0);
      }
    }

    return uniqueDigits.toList();
  }
}
