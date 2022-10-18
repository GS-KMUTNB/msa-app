import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:msa_app/shared/shared.dart';

import '../../theme/theme.dart';

class PerioperativePatientScreen extends StatefulWidget {
  const PerioperativePatientScreen({
    Key? key,
    BuildContext? context,
    required BuildContext buildContext,
  }) : super(key: key);

  @override
  State<PerioperativePatientScreen> createState() =>
      _PerioperativePatientScreen();
}

class _PerioperativePatientScreen extends State<PerioperativePatientScreen> {
  static const defaultWeight = 0.0;
  static const defalutHight = 0.0;
  static const defalutActualOral = 0.0;

  final TextEditingController weightController =
      TextEditingController(text: defaultWeight.toString());
  late TextEditingController heightController =
      TextEditingController(text: defalutHight.toString());
  late TextEditingController actualOralController =
      TextEditingController(text: defalutActualOral.toString());
  final FocusNode weightFocus = FocusNode();
  final FocusNode hightFocus = FocusNode();
  final FocusNode actualOralFocus = FocusNode();
  final _controller = ScrollController();
  final formatter = NumberFormat.decimalPattern();

  late String bmiValue,
      ibwValue,
      resultBmi,
      wValue,
      hValue,
      acValue,
      sexValue,
      edValue,
      pdValue,
      aeValue,
      edResult,
      pdResult,
      aeResult;

  late double ibw, ed, pd, ae;

  bool haveBMIValue = false;
  bool haveDrValue = false;

  List<String> sex = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    translate("gantt_chart.perio_page.male"),
    translate("gantt_chart.perio_page.female")
  ];
  List<String> energy = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    '20',
    '25',
    '30',
    '35',
    '40'
  ];
  List<String> protien = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    '1.0',
    '1.2',
    '1.3',
    '1.4',
    '1.5'
  ];

  double _weight = defaultWeight;
  double _hight = defalutHight;
  // double _actualOral = defalutActualOral;

  @override
  void initState() {
    super.initState();
    weightController.addListener(_onWeightChanged);
    heightController.addListener(_onHightChanged);
    // actualOralController.addListener(_onActualOralChanged);
  }

  _onWeightChanged() {
    setState(() {
      _weight = double.tryParse(weightController.text) ?? 0.0;
    });
  }

  _onHightChanged() {
    setState(() {
      _hight = double.tryParse(heightController.text) ?? 0.0;
    });
  }

  // _onActualOralChanged() {
  //   setState(() {
  //     _actualOral = double.tryParse(actualOralController.text) ?? 0;
  //   });
  // }

  //This method is used to calculate the latest tip amount
  String _calculated(String type) {
    var res = "";
    switch (type) {
      case "bmi":
        var result = (_weight / pow(_hight / 100, 2));

        res = formatter.format(result);
        break;

      case "ibw":
        break;

      case "energy_daily_requirement":
        break;

      case "protien_daily_requirement":
        break;

      case "actual_energy_intake_vs_requirement":
        break;

      default:
        res = "";
    }

    return res;
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    actualOralController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        title: translate("gantt_chart.perio_page.perio_patient"),
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
            title: translate("warning_page_start.warning"),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 30, right: 30),
                    child: Column(
                      children: [
                        HeaderWithCircleAvatar(
                          header: 'Info',
                          content: 'Case Information',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CurveDropDown(
                                title: translate("gantt_chart.sex"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    sexValue = v!;
                                  });
                                },
                                v: sex,
                              ),
                              BmiForm(
                                isGanttChart: true,
                                heightController: heightController,
                                hightFocus: hightFocus,
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
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                validatorWeight: (String? val) {
                                  if (val == null || val.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                                inputFormattersHeight: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                validatorHeight: (String? val) {
                                  if (val == null || val.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              msaSizeBox(),
                              CurveCalculateResultV2(
                                width: width,
                                title: "BMI",
                                result: _calculated("bmi"),
                                axis: 'row',
                                isFollowUp: false,
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: "BMI",
                                result: _calculated("bmi"),
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: "IBW",
                                result: "IBW Result",
                              ),
                              DashedLine(width: width),
                            ],
                          ),
                        ),
                        HeaderWithCircleAvatar(
                          header: 'DR',
                          content: 'Daily Requirement',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CurveDropDown(
                                title: translate("gantt_chart.energy_goal"),
                                width: width,
                                v: energy,
                                onChanged: (String? v) {
                                  setState(() {
                                    edValue = v!;
                                  });
                                },
                              ),
                              CurveDropDown(
                                title: translate("gantt_chart.protien_goal"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    pdValue = v!;
                                  });
                                },
                                v: protien,
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.perio_page.energy_daily"),
                                result: "energy daily Result",
                                axis: "col",
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.perio_page.protein_daily"),
                                result: "protein daily Result",
                                axis: "col",
                              ),
                              CurveFormField(
                                title: translate("gantt_chart.energy_intake"),
                                controller: actualOralController,
                                controllerFocus: actualOralFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                onChanged: (v) {
                                  setState(() {
                                    acValue = actualOralController.text;
                                  });
                                },
                                hint: translate("gantt_chart.fill_info"),
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.perio_page.actual_energy"),
                                result: "protein daily Result",
                                axis: "col",
                              ),
                            ],
                          ),
                        ),
                        msaSizeBox(height: 30),
                        Container(
                          color: primaryColor,
                          height: 50,
                          width: width,
                          child: const PrintPdf(data: null),
                        ),
                        msaSizeBox(),
                        Container(
                          color: primaryColor4,
                          height: 50,
                          width: width,
                          child: TextButton(
                            onPressed: () => {},
                            child: const Text(
                              "reset",
                              style: TextStyle(color: blackColor),
                            ),
                          ),
                        ),
                        msaSizeBox(height: 30),
                      ],
                    ),
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
