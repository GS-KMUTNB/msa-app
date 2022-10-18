import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msa_app/shared/shared.dart';
import 'package:msa_app/theme/theme.dart';

class CurveDropDown extends Column {
  CurveDropDown({
    Key? key,
    required String title,
    required double width,
    required List<String>? v,
    required void Function(String?)? onChanged,
  }) : super(
          key: key,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoSizeText(
              title,
              minFontSize: 14,
              maxLines: 1,
            ),
            msaSizeBox(),
            Container(
                padding: const EdgeInsets.only(left: 20, top: 2),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                )),
                width: width,
                child: DropDownForm(
                  onChanged: onChanged,
                  v: v,
                )),
            msaSizeBox(height: 10),
          ],
        );
}
