import 'package:flutter/services.dart';

class BinaryTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String newText = newValue.text.replaceAll(RegExp('[^01]'), '');

    return newValue.copyWith(text: newText);
  }
}
