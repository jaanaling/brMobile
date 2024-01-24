import 'package:br_mobile/index.dart';

bool textFieldBorderIntCheck(String text) {
  return num.parse(text) > maxInteger || num.parse(text) < minInteger;
}
