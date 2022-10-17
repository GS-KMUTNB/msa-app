import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../theme/theme.dart';

class BmiForm extends SizedBox {
  BmiForm({
    Key? key,
    bool isGanttChart = false,
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
          child: isGanttChart
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    msaSizeBox(height: 10),
                    AutoSizeText(
                      translate("gantt_chart.height"),
                      minFontSize: 14,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: translate("gantt_chart.fill_info"),
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
                    AutoSizeText(
                      translate("gantt_chart.weight"),
                      minFontSize: 14,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: translate("gantt_chart.fill_info"),
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
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: TextFormField(
                        style: head6,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          // hintText: "Please fill Height cm.",
                          labelText:
                              translate("assesment_page.text_box_height"),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: TextFormField(
                        style: head6,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          // hintText: "Please fill Weight kg.",
                          labelText:
                              translate("assesment_page.text_box_weight"),
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
                  ],
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

Color getResultColor(String bmi) {
  if (bmi == translate("assesment_page.text_result_normal")) {
    return Colors.green;
  } else {
    return Colors.red;
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
