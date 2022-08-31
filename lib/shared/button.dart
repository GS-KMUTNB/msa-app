import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MsaButton extends SizedBox {
  MsaButton({
    Key? key,
    required TextStyle textStyle,
    required VoidCallback onPressed,
    required Color color,
    required String text,
    double? w = 280,
    double? h = 60,
  }) : super(
          key: key,
          width: w,
          height: h,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color),
            ),
            onPressed: onPressed,
            child: AutoSizeText(
              text,
              style: textStyle,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        );
}
