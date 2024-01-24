import 'package:br_mobile/index.dart';

class RiemannPage extends StatefulWidget {
  const RiemannPage({super.key});

  @override
  State<RiemannPage> createState() => _RiemannPageState();
}

class _RiemannPageState extends State<RiemannPage> {
  TextEditingController textEditingLeftPointController =
      TextEditingController();
  TextEditingController textEditingRightPointController =
      TextEditingController();
  TextEditingController textEditingAccuracyController =
      TextEditingController(text: '1');
  double function(double x) => x * x;

  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riemann Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title:
                    'Введите левую и правую точки, а так же точность разбиения. Будет выведен результат для функции "a * a" ',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingLeftPointController,
                onChanged: _onChangeTextField,
                keyboardType: TextInputType.number,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingRightPointController,
                onChanged: _onChangeTextField,
                keyboardType: TextInputType.number,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingAccuracyController,
                onChanged: _onChangeTextField,
                keyboardType: TextInputType.number,
              ),
              textResult(
                result,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkCorrectValue(TextEditingController controller) {
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
  }

  void _changeFunction() {
    try {
      result = RiemannIntegral.integrate(
        function,
        double.parse(
          textEditingLeftPointController.text,
        ),
        double.parse(
          textEditingRightPointController.text,
        ),
        double.parse(
          textEditingAccuracyController.text,
        ),
      ).toString();
    } catch (e) {
      result = e.toString();
    }
  }

  void _onChangeTextField(TextEditingController controller) {
    setState(() {
      _checkCorrectValue(
        controller,
      );
      _changeFunction();
    });
  }
}
