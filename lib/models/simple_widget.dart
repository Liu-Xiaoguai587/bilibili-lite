// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/material.dart';

Widget simpleText(
  String text, {
  double size = 10,
  Color? color,
  bool isBold = false,
}) {
  return Text(
    text,
    style: TextStyle(
        color: color ?? Colors.black,
        fontSize: size,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
  );
}

Widget iconWithTextV({
  required Widget icon,
  required Widget text,
  double divide = 5,
}) {
  return Column(children: [icon, Divider(height: divide), text]);
}

Widget iconWithTextH({
  required Widget icon,
  required Widget text,
  double divide = 5,
}) {
  return Row(children: [icon, VerticalDivider(width: divide), text]);
}
