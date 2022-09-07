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
          child: Form(
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
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Weight kg.",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    focusNode: weightFocus,
                    controller: weightController,
                    onSubmitted: (value) {},
                    keyboardType: TextInputType.number,
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
                      hintStyle: TextStyle(color: Colors.grey[800]),
                      hintText: "Height cm.",
                      isDense: true,
                      contentPadding: const EdgeInsets.all(10),
                    ),
                    focusNode: hightFocus,
                    controller: heightController,
                    onSubmitted: (value) {},
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        );
}
