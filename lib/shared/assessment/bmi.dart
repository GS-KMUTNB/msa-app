import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    required List<TextInputFormatter>? inputFormatters,
    required String? Function(String?)? validator,
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
                      hintText: "Weight kg.",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    inputFormatters: inputFormatters,
                    validator: validator,
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
                      hintText: "Height cm.",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    inputFormatters: inputFormatters,
                    validator: validator,
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

String calculateBMI(weight, height) {
  var bmi = (weight / pow(height / 100, 2));
  return bmi.toStringAsFixed(2);
}

String getResult(bmi) {
  if (bmi >= 25) {
    return 'Overweight';
  } else if (bmi > 18.5) {
    return 'Normal';
  } else {
    return 'Underweight';
  }
}

String getInterpretation(bmi) {
  if (bmi >= 25) {
    return 'You have a higher than normal body weight. Try to exercise more.';
  } else if (bmi >= 18.5) {
    return 'You have a normal body weight. Good job!';
  } else {
    return 'You have a lower than normal body weight. You can eat a bit more.';
  }
}
