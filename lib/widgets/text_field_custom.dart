import 'package:br_mobile/index.dart';

Widget textFieldCustom({
  required TextEditingController controller,
  required Function(TextEditingController) onChanged,
  required BuildContext context,
  TextInputType? keyboardType,
  List<TextInputFormatter>? inputFormatters,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.85,
      height: 30,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onChanged: (value) => onChanged(controller),
      ),
    ),
  );
}
