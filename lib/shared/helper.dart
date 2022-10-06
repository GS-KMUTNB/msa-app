import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

Color colorCondition(String value) {
  var color = const Color.fromARGB(73, 0, 0, 0);

  if (value == translate("assesment_page.table_head_yes")) {
    color = Colors.red;
  } else {
    color = Colors.green;
  }

  return color;
}
