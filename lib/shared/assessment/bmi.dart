import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';

class BmiForm extends SizedBox {
  BmiForm({
    Key? key,
    required Key stepperKey,
    required TextEditingController weightController,
    required TextEditingController heightController,
    required FocusNode weightFocus,
    required FocusNode hightFocus,
    Function(String)? onWeightChanged,
    Function(String)? onHeightChanged,
    required List<TextInputFormatter>? inputFormattersWeight,
    required String? Function(String?)? validatorWeight,
    required List<TextInputFormatter>? inputFormattersHeight,
    required String? Function(String?)? validatorHeight,
  }) : super(
          key: key,
          child: Form(
            key: stepperKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      // hintText: "Please fill Weight kg.",
                      labelText: translate("assesment_page.text_box_weight"),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    inputFormatters: inputFormattersWeight,
                    validator: validatorWeight,
                    focusNode: weightFocus,
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => onWeightChanged!(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      // hintText: "Please fill Height cm.",
                      labelText: translate("assesment_page.text_box_height"),
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    inputFormatters: inputFormattersHeight,
                    validator: validatorHeight,
                    focusNode: hightFocus,
                    controller: heightController,
                    onChanged: (value) => onHeightChanged!(value),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        );
}

double calculateBMI(double weight, double height) {
  var bmi = (weight / pow(height / 100, 2));
  return bmi;
}

String getResult(double bmi) {
  if (bmi >= 25) {
    return translate("assesment_page.text_result_overweight");
  } else if (bmi > 18.5) {
    return translate("assesment_page.text_result_normal");
  } else {
    return translate("assesment_page.text_result_underweight");
  }
}

//FIXME make it dynamic
Color getResultColor(String bmi) {
  switch (bmi) {
    case "Overweight":
      return Colors.red;

    case "Normal":
      return Colors.green;

    case "Underweight":
      return Colors.red;

    case "น้ำหนักเกิน":
      return Colors.red;

    case "น้ำหนักปกติ":
      return Colors.green;

    case "น้ำหนักน้อย":
      return Colors.red;

    default:
      return Colors.black;
  }
}

String getInterpretation(double bmi) {
  if (bmi >= 25) {
    return translate("assesment_page.text_guidelines_overweight");
  } else if (bmi >= 18.5) {
    return translate("assesment_page.text_guidelines_normal");
  } else {
    return translate("assesment_page.text_guidelines_underweight");
  }
}
