import 'package:br_mobile/index.dart';

class PontPage extends StatefulWidget {
  const PontPage({super.key});

  @override
  State<PontPage> createState() => _PontPageState();
}

class _PontPageState extends State<PontPage> {
  TextEditingController textEditingX1Controller =
      TextEditingController(text: '0');
  TextEditingController textEditingY1Controller =
      TextEditingController(text: '0');
  TextEditingController textEditingZ1Controller =
      TextEditingController(text: '0');
  TextEditingController textEditingX2Controller =
      TextEditingController(text: '0');
  TextEditingController textEditingY2Controller =
      TextEditingController(text: '0');
  TextEditingController textEditingZ2Controller =
      TextEditingController(text: '0');
  String resultDistance = '';
  String resultEquale = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Point'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              textTitle(
                title:
                    'Введите координаты x, y, z для точек, чтобы расчитатать расстояние между ними, а так же равны ли они',
              ),
              textTitle(
                title: 'Точка 1.',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingX1Controller,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingY1Controller,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingZ1Controller,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textTitle(
                title: 'Точка 2.',
              ),
              textFieldCustom(
                context: context,
                controller: textEditingX2Controller,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingY2Controller,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textFieldCustom(
                context: context,
                controller: textEditingZ2Controller,
                keyboardType: TextInputType.number,
                onChanged: _onChangeTextField,
              ),
              textResult(resultDistance),
              textResult(resultEquale),
            ],
          ),
        ),
      ),
    );
  }

  void _onChangeTextField(TextEditingController controller) {
    setState(() {
      _checkCorrectValue(controller);
      _changeFunction();
    });
  }

  void _checkCorrectValue(TextEditingController controller) {
    if (textFieldZeroCheck(controller.text)) {
      controller.text = controller.text[1];
    }
    if (textFieldEmptyCheck(controller.text)) {
      controller.text = '0';
    }
  }

  void _changeFunction() {
    try {
      final Point point1 = Point(
        double.parse(textEditingX1Controller.text),
        double.parse(textEditingY1Controller.text),
        double.parse(textEditingZ1Controller.text),
      );
      final Point point2 = Point(
        double.parse(textEditingX2Controller.text),
        double.parse(textEditingY2Controller.text),
        double.parse(textEditingZ2Controller.text),
      );
      resultDistance = point1.distanceTo(point2).toString();
      resultEquale = (point1 == point2).toString();
    } catch (e) {
      resultDistance = e.toString();
    }
  }
}
