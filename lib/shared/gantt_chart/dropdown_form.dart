import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class DropDownForm extends DropdownButtonFormField<String> {
  DropDownForm({
    Key? key,
    required List<String>? v,
    required void Function(String?)? onChanged,
  }) : super(
          key: key,
          value: v?.first,
          decoration: const InputDecoration.collapsed(hintText: ''),
          isExpanded: true,
          iconEnabledColor: Colors.grey,
          iconSize: 40,
          validator: (value) => value == v?.first ? 'field required' : null,
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          items: v?.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: onChanged,
        );
}

class DisplayResultStep extends Column {
  DisplayResultStep({
    Key? key,
    required double width,
    String bmi = "",
    String ibw = "",
    String sex = "",
    String energy = "",
    String protein = "",
    String actual = "",
    required String type,
  }) : super(
          key: key,
          children: [
            if (type == "case_infomation") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Case Information',
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  const AutoSizeText(
                    'your result is',
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      const AutoSizeText(
                        "Sex",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                      ),
                      msaSizeBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        width: width / 1.95,
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
                          sex,
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 18,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      const AutoSizeText(
                        "BMI",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                      ),
                      msaSizeBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        width: width / 1.95,
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
                          bmi,
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 18,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      const AutoSizeText(
                        "IBW",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                      ),
                      msaSizeBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        width: width / 1.95,
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
                          ibw,
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 18,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  msaSizeBox(height: 20),
                ],
              )
            ] else if (type == "daily_requirement") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Daily Requirement',
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  const AutoSizeText(
                    'your result is',
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  const AutoSizeText(
                    "Energy daily requirement (kcal)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    child: AutoSizeText(
                      energy,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  msaSizeBox(),
                  const AutoSizeText(
                    "Protein daily requirement (g)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    child: AutoSizeText(
                      protein,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  msaSizeBox(),
                  const AutoSizeText(
                    "% actual energy intake vs requirement",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    child: AutoSizeText(
                      "$actual%",
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  msaSizeBox(height: 20),
                ],
              )
            ] else if (type == "case_infomation_1") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Case Information 1',
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  const AutoSizeText(
                    'your result is',
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      const AutoSizeText(
                        "Sex",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                      ),
                      msaSizeBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        width: width / 1.95,
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
                          sex,
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 18,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      const AutoSizeText(
                        "BMI",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                      ),
                      msaSizeBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        width: width / 1.95,
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
                          bmi,
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 18,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      const AutoSizeText(
                        "IBW",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                      ),
                      msaSizeBox(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.centerLeft,
                        width: width / 1.95,
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
                          ibw,
                          maxLines: 1,
                          minFontSize: 16,
                          maxFontSize: 18,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  msaSizeBox(height: 20),
                ],
              )
            ] else if (type == "case_infomation_2") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    'Case Information 2',
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  const AutoSizeText(
                    'your result is',
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  const AutoSizeText(
                    "Protein daily requirement (g)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    child: AutoSizeText(
                      protein,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  msaSizeBox(),
                  const AutoSizeText(
                    "Protein daily requirement (g)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        )),
                    child: AutoSizeText(
                      protein,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  msaSizeBox(),
                ],
              ),
            ],
          ],
        );
}

double calculateIBW(double height, String sex) {
  var ideal = 0;
  if (sex == "Male") {
    ideal = 100;
  } else {
    ideal = 105;
  }
  var ibw = height - ideal;

  return ibw;
}

double calculateDailyRequirement(String type, double data1, double data2) {
  double result = 0;

  switch (type) {
    case "ed":
      result = data1 * data2;
      break;

    case "pd":
      result = data1 * data2;
      break;

    case "ae":
      result = data1 / data2;
      break;
    default:
      result = 0;
  }
  result = data1 * data2;

  return result;
}
