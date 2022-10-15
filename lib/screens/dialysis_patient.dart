import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../theme/theme.dart';
import '../shared/shared.dart';

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
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController egfrController = TextEditingController();
  final TextEditingController energyController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController albuminController = TextEditingController();
  final TextEditingController prealbuminController = TextEditingController();

  final FocusNode weightFocus = FocusNode();
  final FocusNode heightFocus = FocusNode();
  final FocusNode egfrFocus = FocusNode();
  final FocusNode energyFocus = FocusNode();
  final FocusNode proteinFocus = FocusNode();
  final FocusNode albuminFocus = FocusNode();
  final FocusNode prealbuminFocus = FocusNode();

  bool haveBMIValue = false;
  bool haveCase2Value = false;

  late String bmiValue,
      ibwValue,
      resultBmi,
      wValue,
      hValue,
      sexValue,
      egfrValue,
      ckdValue,
      renalValue,
      aeValue,
      edValue,
      pdValue,
      energyGoalValue,
      protienGoalValue,
      edResult,
      pdResult,
      aeResult;

  late double ibw;

  final _fkDp1 = GlobalKey<FormState>();
  final _fkDp2 = GlobalKey<FormState>();
  final _fkDp3 = GlobalKey<FormState>();
  final formatter = NumberFormat.decimalPattern();
  int _index = 0;
  List<String> sex = <String>['Please select', 'Male', 'Female'];
  List<String> ckdStage = <String>[
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
  List<String> energyGoal = <String>[
    'Please select',
    '25',
    '30',
    '35',
  ];
  List<String> protienGoal = <String>[
    'Please select',
    '0.6',
    '0.7',
    '0.8',
    '0.9',
    '1',
    '1.1',
    '1.2'
  ];
  List<String> renalReplacement = <String>[
    'Please select',
    'Renal Replacement Therapy',
    'No',
    'Hemodialysis',
    'Peritoneal dialysis',
    'Transplantation'
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    // print(haveCase2Value);
    var getStep = <Step>[
      Step(
        isActive: true,
        title: haveBMIValue
            ? DisplayResultStep(
                type: "case_infomation_1",
                width: width,
                bmi: bmiValue,
                ibw: ibwValue,
                sex: sexValue,
              )
            : const AutoSizeText(
                'Case Information 1',
                minFontSize: 16,
                maxLines: 1,
              ),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _fkDp1,
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
                        padding: const EdgeInsets.only(left: 10, top: 2),
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
                          onChanged: (String? v) {
                            setState(() {
                              sexValue = v!;
                            });
                          },
                          v: sex,
                        )),
                    BmiForm(
                      isGanttChart: true,
                      heightController: heightController,
                      hightFocus: heightFocus,
                      weightController: weightController,
                      weightFocus: weightFocus,
                      onWeightChanged: (v) {
                        setState(() {
                          wValue = weightController.text;
                        });
                      },
                      onHeightChanged: (v) {
                        setState(() {
                          hValue = heightController.text;
                        });
                      },
                      inputFormattersWeight: [
                        FilteringTextInputFormatter.allow(numberRegExp)
                      ],
                      validatorWeight: (String? val) {
                        if (val == null || val.isEmpty) {
                          return 'Cannot empty';
                        }
                        return null;
                      },
                      inputFormattersHeight: [
                        FilteringTextInputFormatter.allow(numberRegExp)
                      ],
                      validatorHeight: (String? val) {
                        if (val == null || val.isEmpty) {
                          return 'Cannot empty';
                        }
                        return null;
                      },
                    ),
                    msaSizeBox(height: 20),
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
                      "eGFR (mL/mm/1.73m2)",
                      minFontSize: 14,
                      maxLines: 1,
                    ),
                    MsaFormField(
                      controller: egfrController,
                      controllerFocus: egfrFocus,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(numberRegExp)
                      ],
                      label: 'Please fill infomation',
                      onChanged: (v) {
                        setState(() {
                          egfrValue = egfrController.text;
                        });
                      },
                      validator: (String? v) {
                        if (v == null || v.isEmpty) {
                          return 'Cannot empty';
                        }
                        return null;
                      },
                    ),
                    msaSizeBox(),
                    const AutoSizeText(
                      "CKD Stage ",
                      minFontSize: 14,
                      maxLines: 1,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, top: 2),
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
                          onChanged: (String? v) {
                            setState(() {
                              ckdValue = v!;
                            });
                          },
                          v: ckdStage,
                        )),
                    msaSizeBox(height: 10),
                    const AutoSizeText(
                      "Renal Replacement Therapy",
                      minFontSize: 14,
                      maxLines: 1,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, top: 2),
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
                          onChanged: (String? v) {
                            setState(() {
                              renalValue = v!;
                            });
                          },
                          v: renalReplacement,
                        )),
                    msaSizeBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
          isActive: (_index >= 1) ? true : false,
          title: haveCase2Value
              ? DisplayResultStep(
                  type: "case_infomation_2",
                  width: width,
                  bmi: bmiValue,
                  ibw: ibwValue,
                  sex: sexValue,
                )
              : const AutoSizeText(
                  'Case Information 2',
                  minFontSize: 16,
                  maxLines: 1,
                ),
          content: Form(
            key: _fkDp2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    "Energy daily intake (kCal)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  MsaFormField(
                    controller: energyController,
                    controllerFocus: energyFocus,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(numberRegExp)
                    ],
                    label: 'Please fill infomation',
                    onChanged: (v) {
                      setState(() {
                        edValue = energyController.text;
                      });
                    },
                    validator: (String? v) {
                      if (v == null || v.isEmpty) {
                        return 'Cannot empty';
                      }
                      return null;
                    },
                  ),
                  msaSizeBox(),
                  const AutoSizeText(
                    "Protein daily intake (g)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  MsaFormField(
                    controller: proteinController,
                    controllerFocus: proteinFocus,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(numberRegExp)
                    ],
                    label: 'Please fill infomation',
                    onChanged: (v) {
                      setState(() {
                        pdValue = proteinController.text;
                      });
                    },
                    validator: (String? v) {
                      if (v == null || v.isEmpty) {
                        return 'Cannot empty';
                      }
                      return null;
                    },
                  ),
                  msaSizeBox(),
                  // const AutoSizeText(
                  //   "Energy intake (kCal/kg/day)",
                  //   minFontSize: 14,
                  //   maxLines: 1,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   alignment: Alignment.centerLeft,
                  //   width: width,
                  //   height: 40,
                  //   decoration: const ShapeDecoration(
                  //       color: primaryColor4,
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //             width: 1.0,
                  //             style: BorderStyle.solid,
                  //             color: Colors.grey),
                  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //       )),
                  //   child: const AutoSizeText(
                  //     "16.0 (kCal/kg/day)",
                  //     maxLines: 1,
                  //     minFontSize: 16,
                  //     maxFontSize: 18,
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                  // msaSizeBox(),
                  // const AutoSizeText(
                  //   "Protein intake (g/kg/day)",
                  //   minFontSize: 14,
                  //   maxLines: 1,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   alignment: Alignment.centerLeft,
                  //   width: width,
                  //   height: 40,
                  //   decoration: const ShapeDecoration(
                  //       color: primaryColor4,
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //             width: 1.0,
                  //             style: BorderStyle.solid,
                  //             color: Colors.grey),
                  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //       )),
                  //   child: const AutoSizeText(
                  //     "0.4 (g/kg/day)",
                  //     maxLines: 1,
                  //     minFontSize: 16,
                  //     maxFontSize: 18,
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                  msaSizeBox(),
                  const AutoSizeText(
                    "Energy goal (kCal/kg/day)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  msaSizeBox(),
                  Container(
                      padding: const EdgeInsets.only(left: 10, top: 2),
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
                        onChanged: (String? v) {
                          setState(() {
                            energyGoalValue = v!;
                          });
                        },
                        v: energyGoal,
                      )),
                  msaSizeBox(height: 10),
                  const AutoSizeText(
                    "Protien goal (g/kg/day)",
                    minFontSize: 14,
                    maxLines: 1,
                  ),
                  msaSizeBox(),
                  Container(
                      padding: const EdgeInsets.only(left: 10, top: 2),
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
                        onChanged: (String? v) {
                          setState(() {
                            protienGoalValue = v!;
                          });
                        },
                        v: protienGoal,
                      )),
                  msaSizeBox(),
                  // const AutoSizeText(
                  //   "Energy daily requirement (kCal)",
                  //   minFontSize: 14,
                  //   maxLines: 1,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   alignment: Alignment.centerLeft,
                  //   width: width,
                  //   height: 40,
                  //   decoration: const ShapeDecoration(
                  //       color: primaryColor4,
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //             width: 1.0,
                  //             style: BorderStyle.solid,
                  //             color: Colors.grey),
                  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //       )),
                  //   child: const AutoSizeText(
                  //     "1,250 (kCal)",
                  //     maxLines: 1,
                  //     minFontSize: 16,
                  //     maxFontSize: 18,
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                  // msaSizeBox(),
                  // const AutoSizeText(
                  //   "Protein daily requirement (g)",
                  //   minFontSize: 14,
                  //   maxLines: 1,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   alignment: Alignment.centerLeft,
                  //   width: width,
                  //   height: 40,
                  //   decoration: const ShapeDecoration(
                  //       color: primaryColor4,
                  //       shape: RoundedRectangleBorder(
                  //         side: BorderSide(
                  //             width: 1.0,
                  //             style: BorderStyle.solid,
                  //             color: Colors.grey),
                  //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //       )),
                  //   child: const AutoSizeText(
                  //     "50.0 (g)",
                  //     maxLines: 1,
                  //     minFontSize: 16,
                  //     maxFontSize: 18,
                  //     style: TextStyle(color: Colors.grey),
                  //   ),
                  // ),
                ],
              ),
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
        maxLines: 2,
        ctx: context,
        onPressed: () => showDialog<String>(
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
                    currentStep: _index,
                    onStepCancel: () {
                      if (_index > 0) {
                        setState(() {
                          _index -= 1;
                        });
                      }

                      if (_index == 0) {
                        setState(() {
                          haveBMIValue = false;
                        });
                      } else if (_index == 1) {
                        setState(() {
                          haveCase2Value = false;
                        });
                      }
                    },
                    //*continue
                    onStepContinue: () {
                      var lastStep = _index == getStep.length - 1;

                      if (_fkDp1.currentState!.validate() ||
                          _fkDp2.currentState!.validate()) {
                        // ||
                        //   _fkDp2.currentState!.validate() ||
                        //   _fkDp3.currentState!.validate()
                        if (_index <= getStep.length - 1) {
                          // To next Step
                          if (_index == 0) {
                            setState(() {
                              haveBMIValue = true;
                              _fkDp1.currentState?.reset();
                              _fkDp2.currentState?.reset();
                              _fkDp3.currentState?.reset();

                              var wD = double.parse(wValue);
                              var hD = double.parse(hValue);
                              var bmi = calculateBMI(wD, hD);

                              bmiValue = bmi.toStringAsFixed(2);
                              resultBmi = getResult(bmi);

                              ibw = calculateIBW(hD, sexValue);
                              ibwValue = ibw.toStringAsFixed(2);

                              _index += 1;
                            });
                          } else if (_index == 1) {
                            setState(() {
                              haveCase2Value = true;
                            });
                          } else {
                            setState(() {
                              if (!lastStep) {
                                _index += 1;
                              }
                            });
                          }
                        }
                      }
                      if (_index == 2 && lastStep) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Work in progress')),
                        );
                      }
                    },

                    //*on tab
                    onStepTapped: (int index) => null,
                    steps: getStep,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
