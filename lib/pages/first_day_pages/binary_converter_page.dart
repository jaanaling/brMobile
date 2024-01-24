import 'package:br_mobile/index.dart';

class BinaryConverterPage extends StatefulWidget {
  const BinaryConverterPage({super.key});

  @override
  State<BinaryConverterPage> createState() => _BinaryConverterPageState();
}

class _BinaryConverterPageState extends State<BinaryConverterPage> {
  TextEditingController textEditingBinaryController = TextEditingController();
  TextEditingController textEditingDecimalController = TextEditingController();
  String binaryResult = '';
  String decimalResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binary converter'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title: 'Введите десятичное число для перевода в двоичное',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingBinaryController,
                onChanged: _onChangeTextFieldBinary,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\.')),
                ],
              ),
              textResult(
                binaryResult,
              ),
              textTitle(
                title: 'Введите двоичное число для перевода в десятичное',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingDecimalController,
                onChanged: _onChangeTextFieldDecimal,
                keyboardType: TextInputType.number,
                inputFormatters: [BinaryTextInputFormatter()],
              ),
              textResult(
                decimalResult,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _checkCorrectValueBinary(TextEditingController controller) {
    if (textFieldZeroCheck(
      controller.text,
    )) {
      controller.text = controller.text[1];
    }
    if (textFieldEmptyCheck(
      controller.text,
    )) {
      controller.text = '0';
    }
    if (textFieldBorderIntCheck(
      controller.text,
    )) {
      binaryResult = 'Неверное значение!';
      return false;
    }
    return true;
  }

  void _changeFunctionBinary(TextEditingController controller) {
    try {
      binaryResult = BinaryConverter.decimalToBinary(
        int.parse(controller.text),
      );
    } catch (e) {
      binaryResult = e.toString();
    }
  }

  void _onChangeTextFieldBinary(TextEditingController controller) {
    setState(() {
      if (_checkCorrectValueBinary(controller)) {
        _changeFunctionBinary(controller);
      }
    });
  }

  void _onChangeTextFieldDecimal(TextEditingController controller) {
    setState(
      () => decimalResult = BinaryConverter.binaryToDecimal(
        controller.text,
      ).toString(),
    );
  }
}
