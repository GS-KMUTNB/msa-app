import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ContainerText extends Stack {
  ContainerText({
    Key? key,
    double? w,
    double? h,
    double? wShadow,
    double? hShadow,
    Color? color,
    Color? shadowColor,
    Color textColor = Colors.black,
    required String text,
    double borderRadius = 15,
  }) : super(key: key, children: [
          Container(
            width: wShadow,
            height: hShadow,
            decoration: BoxDecoration(
              color: shadowColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: w,
            height: h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: AutoSizeText(
              text,
              minFontSize: 15,
              style: TextStyle(color: textColor),
            ),
          ),
        ]);
}
