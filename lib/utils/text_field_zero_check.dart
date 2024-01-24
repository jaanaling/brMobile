bool textFieldZeroCheck(String text) {
  return RegExp('^0[0-9]').hasMatch(text);
}
