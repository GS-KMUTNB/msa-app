import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextRowResult extends Row {
  TextRowResult({
    Key? key,
    required String header,
    required String data,
    required String unit,
  }) : super(
          key: key,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: AutoSizeText(
                  header,
                  maxLines: 1,
                )),
            Expanded(
                flex: 1,
                child: AutoSizeText(
                  data,
                  maxLines: 1,
                  minFontSize: 8,
                )),
            Expanded(flex: 2, child: AutoSizeText(unit)),
          ],
        );
}
