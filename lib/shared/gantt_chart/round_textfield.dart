import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class RoundTextField extends Row {
  RoundTextField({Key? key, double? width})
      : super(
          key: key,
          children: [
            const AutoSizeText(
              "Round",
              minFontSize: 18,
            ),
            msaSizeBox(width: 10),
            SizedBox(
              width: width,
              child: TextFormField(
                style: head6,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  // hintText: "Please fill Weight kg.",
                  hintText: "Please fill info",
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
          ],
        );
}
