import 'package:flutter/material.dart';

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
                    contentPadding: const EdgeInsets.all(10), // Added this
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
                    contentPadding: const EdgeInsets.all(10), // Added this
                  ),
                  focusNode: hightFocus,
                  controller: heightController,
                ),
              ),
            ],
          ),
        );
}
