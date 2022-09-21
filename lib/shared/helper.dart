import 'package:flutter/material.dart';

Color colorCondition(String value) {
  var color = const Color.fromARGB(73, 0, 0, 0);

  switch (value) {
    case "Yes":
      color = Colors.red;
      break;

    case "No":
      color = Colors.green;
      break;

    default:
      color = const Color.fromARGB(73, 0, 0, 0);
  }
  return color;
}
