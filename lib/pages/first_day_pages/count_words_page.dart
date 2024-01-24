import 'package:br_mobile/index.dart';

class CountWordsPage extends StatefulWidget {
  const CountWordsPage({super.key});

  @override
  State<CountWordsPage> createState() => _CountWordsPageState();
}

class _CountWordsPageState extends State<CountWordsPage> {
  TextEditingController textEditingController = TextEditingController();
  Map<String, int> wordCounter = {};

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
                title: 'Введите предложение, для подсчёта слов в нём',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingController,
                onChanged: _onChangeTextField,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: wordCounter.length,
                  itemBuilder: (context, index) {
                    final word = wordCounter.keys.elementAt(index);
                    final quantity = wordCounter[word];
                    return textResult(
                      '$word: $quantity',
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeTextField(TextEditingController controller) {
    setState(
      () => wordCounter = CountWordInList.countWords(
        controller.text.split(' '),
      ),
    );
  }
}
