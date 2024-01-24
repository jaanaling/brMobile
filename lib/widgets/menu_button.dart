import 'package:flutter/material.dart';

Widget menuButton({
  required String title,
  required String path,
  required BuildContext context,
}) {
  return SizedBox(
    width: MediaQuery.sizeOf(context).width * 0.35,
    height: 60,
    child: MaterialButton(
      color: const Color.fromARGB(255, 230, 116, 50),
      onPressed: () => Navigator.pushNamed(context, path),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          24,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),
  );
}
