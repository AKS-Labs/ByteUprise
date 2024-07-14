import 'package:byteuprise/consts/consts.dart';
import 'package:flutter/material.dart';

Widget internshipButton({String? title, icon}) {
  return Row(
    children: [
      Image.asset(icon, width: 50, fit: BoxFit.fill),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(240)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(const EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make();
}
