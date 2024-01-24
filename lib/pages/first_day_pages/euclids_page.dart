import 'package:br_mobile/index.dart';

class EuclidsPage extends StatefulWidget {
  const EuclidsPage({super.key});

  @override
  State<EuclidsPage> createState() => _EuclidsPageState();
}

class _EuclidsPageState extends State<EuclidsPage> {
  TextEditingController textEditingFirstNumController =
      TextEditingController(text: '1');
  TextEditingController textEditingSecondNumController =
      TextEditingController(text: '1');
  String resultGCD = '';
  String resultLCM = '';
  String resultPrimeFactors = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Euclids'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title:
                    'Введите два числа. Будет произведёт расчёт их НОД, НОК, и вернёт простые множители для первого числа',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingFirstNumController,
                onChanged: _onChangeTextField,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\.')),
                ],
                keyboardType: TextInputType.number,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingSecondNumController,
                onChanged: _onChangeTextField,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\.')),
                ],
                keyboardType: TextInputType.number,
              ),
              textResult(
                resultGCD,
              ),
              textResult(
                resultLCM,
              ),
              textResult(
                resultPrimeFactors,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _checkCorrectValue(TextEditingController controller) {
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
      resultGCD = 'Неверное значение!';
      resultLCM = 'Неверное значение!';
      resultPrimeFactors = 'Неверное значение!';
      return false;
    }
    return true;
  }

  void _changeFunction() {
    resultGCD = EuclidsAlgoritms.findGCD(
      int.parse(textEditingFirstNumController.text),
      int.parse(textEditingSecondNumController.text),
    ).toString();

    try {
      resultLCM = EuclidsAlgoritms.findLCM(
        int.parse(textEditingFirstNumController.text),
        int.parse(textEditingSecondNumController.text),
      ).toString();
    } catch (e) {
      resultLCM = e.toString();
    }

    resultPrimeFactors = EuclidsAlgoritms.primeFactors(
      int.parse(textEditingFirstNumController.text),
    ).toString();
  }

  void _onChangeTextField(TextEditingController controller) {
    setState(() {
      if (_checkCorrectValue(
        controller,
      )) _changeFunction();
    });
  }
}
