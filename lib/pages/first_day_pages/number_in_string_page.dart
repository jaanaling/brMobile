import 'package:br_mobile/index.dart';

class NumberInStringPage extends StatefulWidget {
  const NumberInStringPage({super.key});

  @override
  State<NumberInStringPage> createState() => _NumberInStringPageState();
}

class _NumberInStringPageState extends State<NumberInStringPage> {
  TextEditingController textEditingController = TextEditingController();
  String numbers = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Words'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title:
                    'Введите предложение. Цифры из предложения будут отображенны',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingController,
                onChanged: _onChangeTextField,
              ),
              textResult(
                numbers,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeTextField(TextEditingController controller) {
    setState(
      () => numbers = NumberInString.findNumbersInString(
        controller.text,
      ).toString(),
    );
  }
}
