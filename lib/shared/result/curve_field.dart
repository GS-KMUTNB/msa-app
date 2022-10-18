import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msa_app/theme/theme.dart';

class CurveCalculateResult extends Column {
  CurveCalculateResult({
    Key? key,
    required double width,
    String axis = "row",
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
                        children: [
                          AutoSizeText(
                            title,
                            maxLines: 1,
                            minFontSize: 16,
                            maxFontSize: 18,
                          ),
                          msaSizeBox(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            width: width / 1.9,
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
                              maxLines: 1,
                              minFontSize: 16,
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
                        minFontSize: 14,
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
                          maxLines: 1,
                          minFontSize: 16,
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
