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

class DashedLine extends Padding {
  DashedLine({Key? key, required double width})
      : super(
          key: key,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              for (int i = 0; i < width / 8.5; i++)
                Container(
                  width: 5,
                  height: 1,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: i % 2 == 0
                            ? const Color.fromRGBO(214, 211, 211, 1)
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
}

class HeaderWithCircleAvatar extends Row {
  HeaderWithCircleAvatar(
      {Key? key, required String header, required String content})
      : super(key: key, children: [
          CircleAvatar(
            backgroundColor: primaryColor1,
            child: Text(
              header,
              style: const TextStyle(color: whiteColor, fontSize: 12),
            ),
          ),
          msaSizeBox(width: 10),
          Text(content)
        ]);
}
