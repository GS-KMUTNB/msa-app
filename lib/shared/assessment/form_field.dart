import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/theme.dart';

class MsaFormField extends SizedBox {
  MsaFormField({
    Key? key,
    required TextEditingController controller,
    required FocusNode controllerFocus,
    required Function(String)? onChanged,
    required List<TextInputFormatter>? inputFormatters,
    required String? Function(String?)? validator,
    required String label,
  }) : super(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                  style: head6,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    // hintText: "Please fill Weight kg.",
                    labelText: label,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                  ),
                  inputFormatters: inputFormatters,
                  validator: validator,
                  focusNode: controllerFocus,
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => onChanged!(value),
                ),
              ),
            ],
          ),
        );
}
