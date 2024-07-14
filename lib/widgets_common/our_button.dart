import 'package:byteuprise/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, color, textColor, title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: prplColor,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: "$title".text.color(textColor).fontFamily(semibold).make(),
  );
}
