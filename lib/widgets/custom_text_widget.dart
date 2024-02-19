import 'package:flutter/material.dart';


Widget customTextWidget(BuildContext context,{
  required String data,
  required Color textColor,
  required double fontSize,
  required FontWeight fontWeight,
  TextAlign? textAlign,
  TextOverflow? textOverflow = TextOverflow.visible,
  int? maxLines = 10,
}) => Text(
  data,
  textAlign: textAlign ?? TextAlign.left,
  maxLines: maxLines,
  style: TextStyle(
    color: textColor,
    fontSize: fontSize,
    fontWeight: fontWeight,
    overflow: textOverflow,
  ),
);

