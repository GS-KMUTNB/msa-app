import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../theme/theme.dart';

Color colorCondition(String value) {
  var color = const Color.fromARGB(73, 0, 0, 0);

  if (value == translate("assesment_page.table_head_yes")) {
    color = Colors.red;
  } else {
    color = Colors.green;
  }

  return color;
}

class MsaRichText extends RichText {
  MsaRichText({
    Key? key,
    required String title,
    required String result,
    String? unit,
  }) : super(
          key: key,
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "$title ",
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
              TextSpan(
                text: "$result ",
                style: const TextStyle(
                  fontSize: 14,
                  color: primaryColor1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: unit,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              )
            ],
          ),
        );
}
