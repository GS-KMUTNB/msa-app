import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class BmiForm extends SizedBox {
  BmiForm({
    Key? key,
    required TextEditingController weightController,
    required TextEditingController heightController,
    required FocusNode weightFocus,
    required FocusNode hightFocus,
  }) : super(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        "BMI",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Weight kg.",
                          fillColor: Colors.white70,
                          isDense: true, // Added this
                          contentPadding:
                              const EdgeInsets.all(10), // Added this
                        ),
                        focusNode: weightFocus,
                        controller: weightController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "Height cm.",
                          fillColor: Colors.white70,
                          isDense: true, // Added this
                          contentPadding:
                              const EdgeInsets.all(10), // Added this
                        ),
                        focusNode: hightFocus,
                        controller: heightController,
                      ),
                    ),
                  ],
                ),
              ],
            ));
}
