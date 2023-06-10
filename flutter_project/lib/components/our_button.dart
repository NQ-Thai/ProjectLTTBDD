
import 'package:flutter/material.dart';
import 'package:flutter_project/consts/consts.dart';

Widget ourButton({onPress, color, textColor, title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor:  color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: () {
      onPress;
    },
    child: title.text.color(textColor).frontFamily(bold).make(),
  );
}