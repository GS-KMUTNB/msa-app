import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../../theme/theme.dart';

class MsaFormField extends SizedBox {
  MsaFormField(
      {Key? key,
      required TextEditingController controller,
      required FocusNode controllerFocus,
      required Function(String)? onChanged,
      required List<TextInputFormatter>? inputFormatters,
      required String? Function(String?)? validator,
      String hint = ""})
      : super(
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
                    hintText: translate("gantt_chart.fill_info"),
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
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
