import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msa_app/shared/shared.dart';
import 'package:msa_app/theme/theme.dart';

class CurveCalculateResult extends Column {
  CurveCalculateResult({
    Key? key,
    required double width,
    String axis = "row",
    bool isFollowUp = false,
    required String title,
    required String result,
  }) : super(
          key: key,
          children: [
            axis == "row"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      msaSizeBox(height: 10),
                      Row(
                        mainAxisAlignment: isFollowUp
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: isFollowUp ? width / 3 : 30,
                            child: AutoSizeText(
                              title,
                              minFontSize: 5,
                              maxLines: 1,
                              maxFontSize: 18,
                            ),
                          ),
                          msaSizeBox(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            width: isFollowUp ? width / 4 : width / 1.9,
                            height: 40,
                            decoration: const ShapeDecoration(
                                color: primaryColor4,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                )),
                            child: AutoSizeText(
                              result,
                              minFontSize: 10,
                              maxLines: 1,
                              maxFontSize: 18,
                              style: const TextStyle(color: primaryColor),
                            ),
                          )
                        ],
                      ),
                      msaSizeBox(height: 10),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        title,
                        minFontSize: 5,
                        maxLines: 1,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        width: width,
                        height: 40,
                        decoration: const ShapeDecoration(
                            color: primaryColor4,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            )),
                        child: AutoSizeText(
                          result,
                          minFontSize: 5,
                          maxLines: 1,
                          maxFontSize: 18,
                          style: const TextStyle(color: primaryColor),
                        ),
                      ),
                      msaSizeBox(),
                    ],
                  )
          ],
        );
}

class CurveFormField extends Column {
  CurveFormField({
    Key? key,
    required String title,
    required TextEditingController controller,
    required FocusNode controllerFocus,
    required Function(String)? onChanged,
    List<TextInputFormatter>? inputFormatters,
    required String? Function(String?)? validator,
    String hint = "",
  }) : super(
          key: key,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              title,
              minFontSize: 5,
              maxLines: 1,
            ),
            MsaFormField(
              controller: controller,
              controllerFocus: controllerFocus,
              inputFormatters: inputFormatters,
              hint: hint,
              onChanged: onChanged,
              validator: validator,
            ),
          ],
        );
}
