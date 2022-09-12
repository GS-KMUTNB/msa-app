import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class CardContent extends Container {
  CardContent({
    required double w,
    required double h,
    required Color color,
    required Widget child,
    Key? key,
    double minFontSizeHeader = 12,
    double minFontSizeContent = 12,
    bool? haveButton,
    VoidCallback? button,
  }) : super(
          key: key,
          width: w,
          height: h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
            // border: Border.all(color: Colors.black),
            boxShadow: const [
              BoxShadow(
                blurRadius: 0.5,
                offset: Offset(3, 3),
              ), //BoxShadow
              BoxShadow(
                color: primaryColor1,
                blurRadius: 0,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: child,
        );
}
