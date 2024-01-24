class CountWordInList {
  static Map<String, int> countWords(List<String> words) {
    final Map<String, int> wordCountMap = {};

    for (final String word in words) {
      final String lowercaseWord = word.toLowerCase();
      wordCountMap[lowercaseWord] = (wordCountMap[lowercaseWord] ?? 0) + 1;
    }

    return wordCountMap;
  }
}
