import 'package:br_mobile/index.dart';

class UniqueDigitsPage extends StatefulWidget {
  const UniqueDigitsPage({super.key});

  @override
  State<UniqueDigitsPage> createState() => _UniqueDigitsPageState();
}

class _UniqueDigitsPageState extends State<UniqueDigitsPage> {
  TextEditingController textEditingController = TextEditingController();
  String numbers = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unique Digits'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title:
                    'Введите предложение. Цифры, введённые на английском языке будут конвертированы в десятичний вид. Будут отображенны только уникальные варианты',
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
      () => numbers = ExtractUniqueDigits.extractUniqueDigits(
        controller.text,
      ).toString(),
    );
  }
}
