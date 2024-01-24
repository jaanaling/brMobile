import 'package:br_mobile/index.dart';

class RootExtensionPage extends StatefulWidget {
  const RootExtensionPage({super.key});

  @override
  State<RootExtensionPage> createState() => _RootExtensionPageState();
}

class _RootExtensionPageState extends State<RootExtensionPage> {
  TextEditingController textEditingNumberController =
      TextEditingController(text: '1');
  TextEditingController textEditingDegreeController =
      TextEditingController(text: '1');
  String number = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root Extension'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title: 'Введите число и его степень.',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingNumberController,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingDegreeController,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textResult(
                number,
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
      number = 'Неверное значение!';
      return false;
    }
    return true;
  }

  void _changeFunction() {
    try {
      number = num.parse(textEditingNumberController.text)
          .root(int.parse(textEditingDegreeController.text))
          .toString();
    } catch (e) {
      number = e.toString();
    }
  }

  void _onChangeTextField(TextEditingController controller) {
    setState(() {
      if (_checkCorrectValue(
        controller,
      )) _changeFunction();
    });
  }
}
