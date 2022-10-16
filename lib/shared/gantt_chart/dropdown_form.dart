import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/shared/helper.dart';

import '../../theme/theme.dart';
import '../shared.dart';

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
    String energyReq = "",
    String proteinReq = "",
    String actual = "",
    String eGFR = "",
    String cdkStage = "",
    String renal = "",
    String albumin = "",
    String prealbumin = "",
    String followUpBmi = "",
    String diffBodyWeight = "",
    String diffAlbumin = "",
    String diffPrealbumin = "",
    String intervention = "",
    required String type,
  }) : super(
          key: key,
          children: [
            if (type == "case_infomation") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.title_1"),
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.your_result"),
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      AutoSizeText(
                        translate("gantt_chart.sex"),
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
                          style: const TextStyle(color: primaryColor),
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
                          style: const TextStyle(color: primaryColor),
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
                          style: const TextStyle(color: primaryColor),
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
                  AutoSizeText(
                    translate("gantt_chart.perio_page.title_2"),
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.your_result"),
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.energy_daily"),
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
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.protein_daily"),
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
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.actual_energy"),
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
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(height: 20),
                ],
              )
            ] else if (type == "case_infomation_1") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.title_1"),
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  MsaRichText(
                    title: 'eGFR :',
                    result: eGFR,
                    unit: "(mL/mm/1.73m2)",
                  ),
                  MsaRichText(
                    title: 'CDK :',
                    result: cdkStage,
                  ),
                  MsaRichText(
                    title: '${translate("gantt_chart.dialysis_page.renal")} :',
                    result: renal,
                  ),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.your_result"),
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  Row(
                    children: [
                      AutoSizeText(
                        translate("gantt_chart.sex"),
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
                          style: const TextStyle(color: primaryColor),
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
                          style: const TextStyle(color: primaryColor),
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
                          style: const TextStyle(color: primaryColor),
                        ),
                      )
                    ],
                  ),
                  msaSizeBox(height: 20),
                  Row(
                    children: [
                      for (int i = 0; i < width / 8.5; i++)
                        Container(
                          width: 5,
                          height: 1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: i % 2 == 0
                                    ? const Color.fromRGBO(214, 211, 211, 1)
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  msaSizeBox(height: 20),
                ],
              )
            ] else if (type == "case_infomation_2") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.title_2"),
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.your_result"),
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.energy_daily"),
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
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.energy_daily"),
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
                      energyReq,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(),
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.protein_intake"),
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
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.protein_daily"),
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
                      proteinReq,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(height: 20),
                  Row(
                    children: [
                      for (int i = 0; i < width / 8.5; i++)
                        Container(
                          width: 5,
                          height: 1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: i % 2 == 0
                                    ? const Color.fromRGBO(214, 211, 211, 1)
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  msaSizeBox(height: 20),
                ],
              ),
            ] else if (type == "nutrition_parameter_baseline") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.title_3"),
                    minFontSize: 16,
                    maxLines: 1,
                  ),
                  MsaRichText(
                    title:
                        '${translate("gantt_chart.dialysis_page.serum_albumin")} :',
                    result: albumin,
                    unit: "(g/dl)",
                  ),
                  MsaRichText(
                    title:
                        '${translate("gantt_chart.dialysis_page.serum_prealbumin")} :',
                    result: prealbumin,
                    unit: "(mg/dl)",
                  ),
                  msaSizeBox(height: 20),
                  Row(
                    children: [
                      for (int i = 0; i < width / 8.5; i++)
                        Container(
                          width: 5,
                          height: 1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: i % 2 == 0
                                    ? const Color.fromRGBO(214, 211, 211, 1)
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  msaSizeBox(height: 20),
                ],
              ),
            ] else if (type == "nutrition_parameter_follow_up") ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.title_4"),
                    minFontSize: 15,
                    maxLines: 1,
                  ),
                  MsaRichText(
                    title:
                        '${translate("gantt_chart.dialysis_page.intervention_duration")} :',
                    result: intervention,
                    unit: "(${translate("gantt_chart.dialysis_page.week")})",
                  ),
                  AutoSizeText(
                    translate("gantt_chart.perio_page.your_result"),
                    minFontSize: 8,
                    maxLines: 1,
                  ),
                  msaSizeBox(height: 10),
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.follow_bmi"),
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
                      followUpBmi,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(height: 10),
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.diff_body_weight"),
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
                      diffBodyWeight,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(height: 10),
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.diff_sr_albumin"),
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
                      diffAlbumin,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(height: 10),
                  AutoSizeText(
                    translate("gantt_chart.dialysis_page.diff_sr_prealbumin"),
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
                      diffPrealbumin,
                      maxLines: 1,
                      minFontSize: 16,
                      maxFontSize: 18,
                      style: const TextStyle(color: primaryColor),
                    ),
                  ),
                  msaSizeBox(),
                  msaSizeBox(height: 20),
                  Row(
                    children: [
                      for (int i = 0; i < width / 8.5; i++)
                        Container(
                          width: 5,
                          height: 1,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1,
                                color: i % 2 == 0
                                    ? const Color.fromRGBO(214, 211, 211, 1)
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  msaSizeBox(height: 20),
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

double calculateGanttChart(String type, double data1, double data2) {
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

    case "fu-bmi":
      result = data1 / ((data2 / 100) * (data2 / 100));
      break;

    case "diff-bw":
      result = (data1 - data2) / data2;
      break;

    case "diff-al":
      //data 1 = albumin in baseline
      //data 2 = albumin in follow up
      result = (data1 - data2) / data2;
      break;

    case "diff-pal":
      //data 1 = prealbumin in baseline
      //data 2 = prealbumin in follow up
      result = (data1 - data2) / data2;
      break;

    default:
      result = 0;
  }
  result = data1 * data2;

  return result;
}
