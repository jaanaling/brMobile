import 'dart:math';

class BinaryConverter {
  static String decimalToBinary(int decimal) {
    if (decimal == 0) {
      return '0';
    }

    String binary = '';
    while (decimal > 0) {
      final int remainder = decimal % 2;
      binary = '$remainder$binary';
      decimal ~/= 2;
    }

    return binary;
  }

  static num binaryToDecimal(String binary) {
    if (binary.isEmpty) {
      return 0;
    }

    num decimal = 0;
    num power = 0;

    for (int i = binary.length - 1; i >= 0; i--) {
      final int digit = int.parse(binary[i]);
      decimal += digit * pow(2, power);
      power++;
    }

    return decimal;
  }
}
