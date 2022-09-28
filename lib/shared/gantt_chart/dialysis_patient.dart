import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import '../globals/alert_hint.dart';
import '../shared.dart';

class DialysisPatientScreen extends StatefulWidget {
  const DialysisPatientScreen({
    Key? key,
    BuildContext? context,
    required BuildContext buildContext,
  }) : super(key: key);

  @override
  State<DialysisPatientScreen> createState() => _DialysisPatientScreen();
}

class _DialysisPatientScreen extends State<DialysisPatientScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    const List<String> sex = <String>['Please select', 'Male', 'Female'];

    const List<String> ckdStage = <String>[
      'Please select',
      'CKD Stage',
      'No CKD',
      '1',
      '2',
      '3A',
      '3B',
      '4',
      'ERSD'
    ];

    const List<String> energyGoal = <String>[
      'Please select',
      'Energy goal (kcal/kg/day)',
      '25',
      '30',
      '35',
    ];

    const List<String> protienGoal = <String>[
      'Please select',
      'Protien goal (g/kg/day)',
      '0.6',
      '0.7',
      '0.8',
      '0.9',
      '1',
      '1.1',
      '1.2'
    ];

    const List<String> renalReplacement = <String>[
      'Please select',
      'Renal Replacement Therapy',
      'No',
      'Hemodialysis',
      'Peritoneal dialysis',
      'Transplantation'
    ];

    String energyGoalValue = energyGoal.first;
    String protienGoalValue = protienGoal.first;
    String ckdStageValue = ckdStage.first;
    String renalReplacementValue = renalReplacement.first;
    String sexValue = sex.first;

    var getStep = <Step>[
      Step(
          title: const AutoSizeText(
            'Case Information 1',
            minFontSize: 16,
            maxLines: 1,
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Sex",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: sexValue,
                      items: sex.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          sexValue = value!;
                        });
                      }),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Height",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Width",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(height: 10),
                Row(
                  // Dashed line
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
                      child: const AutoSizeText(
                        "17.18 kg./m^2",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
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
                      child: const AutoSizeText(
                        "17.18 kg./m^2",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                msaSizeBox(height: 10),
                Row(
                  // Dashed line
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
                msaSizeBox(),
                const AutoSizeText(
                  "eGFR (mL/mm/1.73m2)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "CKD Stage ",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: ckdStageValue,
                      items: ckdStage
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          ckdStageValue = value!;
                        });
                      }),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Renal Replacement Therapy",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: renalReplacementValue,
                      items: renalReplacement
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          renalReplacementValue = value!;
                        });
                      }),
                ),
              ],
            ),
          )),
      Step(
          title: const AutoSizeText(
            'Case Information 2',
            minFontSize: 16,
            maxLines: 1,
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Energy daily intake (kCal)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Protein daily intake (g)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Energy intake (kCal/kg/day)",
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
                  child: const AutoSizeText(
                    "16.0 (kCal/kg/day)",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Protein intake (g/kg/day)",
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
                  child: const AutoSizeText(
                    "0.4 (g/kg/day)",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Energy goal (kCal/kg/day)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: energyGoalValue,
                      items: energyGoal
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          energyGoalValue = value!;
                        });
                      }),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Protien goal (g/kg/day)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1.0,
                        style: BorderStyle.solid,
                        color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  )),
                  width: width,
                  height: 40,
                  child: DropdownButton(
                      underline: const SizedBox(),
                      isExpanded: true,
                      iconEnabledColor: Colors.grey,
                      iconSize: 36,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      value: protienGoalValue,
                      items: protienGoal
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          protienGoalValue = value!;
                        });
                      }),
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Energy daily requirement (kCal)",
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
                  child: const AutoSizeText(
                    "1,250 (kCal)",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: TextStyle(color: Colors.grey),
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
                  child: const AutoSizeText(
                    "50.0 (g)",
                    maxLines: 1,
                    minFontSize: 16,
                    maxFontSize: 18,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          )),
      Step(
          title: const AutoSizeText(
            'Nutrition parameter (Baseline)',
            minFontSize: 16,
            maxLines: 1,
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      child: const AutoSizeText(
                        "50 (kg)",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
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
                      child: const AutoSizeText(
                        "17.8 (kg./m^2)",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                msaSizeBox(height: 10),
                Row(
                  // Dashed line
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
                msaSizeBox(),
                const AutoSizeText(
                  "Serum albumin (g/dl)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Serum prealbumin (mg/dl)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          )),
      Step(
          title: const AutoSizeText(
            'Nutrition parameter (Follow-up)',
            minFontSize: 16,
            maxLines: 1,
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AutoSizeText(
                  "Intervention duration (weeks)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Follow-up actual weight (kg)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(height: 10),
                Row(
                  children: [
                    const AutoSizeText(
                      "Follow-up BMI (kg/m2)",
                      maxLines: 1,
                      minFontSize: 12,
                      maxFontSize: 14,
                    ),
                    msaSizeBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      width: width / 4.9,
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
                      child: const AutoSizeText(
                        "26.7",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                msaSizeBox(height: 10),
                Row(
                  // Dashed line
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
                msaSizeBox(height: 10),
                const AutoSizeText(
                  "Serum albumin (g/dl)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(),
                const AutoSizeText(
                  "Serum prealbumin (mg/dl)",
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Please fill info",
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.number,
                ),
                msaSizeBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText(
                      "% diff of body weight",
                      maxLines: 1,
                      minFontSize: 12,
                      maxFontSize: 14,
                    ),
                    msaSizeBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      width: width / 5,
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
                      child: const AutoSizeText(
                        "50.00%",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                msaSizeBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText(
                      "% diff of Sr.albumin",
                      maxLines: 1,
                      minFontSize: 12,
                      maxFontSize: 14,
                    ),
                    msaSizeBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      width: width / 5,
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
                      child: const AutoSizeText(
                        "16.67%",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
                msaSizeBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText(
                      "% diff of Sr.prealbumin",
                      maxLines: 1,
                      minFontSize: 12,
                      maxFontSize: 14,
                    ),
                    msaSizeBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      width: width / 5,
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
                      child: const AutoSizeText(
                        "7.14%",
                        maxLines: 1,
                        minFontSize: 16,
                        maxFontSize: 18,
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    ];

    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        title: 'GANTT CHART Energy & Protein Intake Calculator',
        ctx: context,
        onPressed: () => showDialog<String>(
          // ignore: fixme
          //FIXME PART GO
          context: context,
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
            ifPicture: false,
            haveButton: true,
            have2Button: true,
            haveColorText: true,
            haveQuestions: false,
            title: 'Warning!!!',
            width: width,
            height: height / 2,
            onPressedYes: () {
              Navigator.of(context)
                ..pop()
                ..pop();
            },
            onPressedNo: () {
              Navigator.pop(context);
            },
          ),
        ),
        onPressedHint: () => showDialog<String>(
          context: context,
          // ignore: fixme
          //FIXME waiting design
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
            ifPicture: true,
            haveButton: false,
            haveColorText: false,
            haveQuestions: false,
            haveCloseButton: true,
            title: 'User Manual',
            subTextContent:
                "Description : Nutritional status screening page \n1. progress tube is a tube that indicates the status of the nutritional status screening.\n2. Calculate BMI, enter weight and height, then enter confirmation to calculate BMI.\n3. There are four screening topics, each with a yes and no answer.",
            height: height / 2,
            width: width,
          ),
        ),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: CardContent(
                w: width - 40,
                h: height / 1.20,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40, right: 10, left: 10),
                  child: MsaStepper(
                      context: context,
                      currentStep: 0,
                      onStepCancel: () {},
                      onStepContinue: () {},
                      onStepTapped: (int index) => null,
                      steps: getStep),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
