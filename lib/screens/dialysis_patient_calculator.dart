import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
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
  final TextEditingController interventionController = TextEditingController();
  final TextEditingController followUpActualController =
      TextEditingController();
  final TextEditingController albuminFollowUpController =
      TextEditingController();
  final TextEditingController prealbuminFollowUpController =
      TextEditingController();

  final FocusNode weightFocus = FocusNode();
  final FocusNode hightFocus = FocusNode();
  final FocusNode egfrFocus = FocusNode();
  final FocusNode energyFocus = FocusNode();
  final FocusNode proteinFocus = FocusNode();
  final FocusNode albuminFocus = FocusNode();
  final FocusNode prealbuminFocus = FocusNode();
  final FocusNode interventionFocus = FocusNode();
  final FocusNode followUpActualFocus = FocusNode();
  final FocusNode albuminFollowUpFocus = FocusNode();
  final FocusNode prealbuminFollowUpFocus = FocusNode();
  final _controller = ScrollController();

  bool haveBMIValue = false;
  bool haveCase2Value = false;
  bool haveNutritionValue = false;
  bool haveFollowUpValue = false;

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
      edReqResult,
      pdReqResult,
      albuminValue,
      prealbuminValue,
      followUpValue,
      diffBodyWeightValue,
      diffAlbuminValue,
      diffPrealbuminValue,
      interventionValue,
      followUpActualValue,
      albuminFollowUpValue,
      prealbuminFollowUpValue,
      heightValue,
      weightValue;

  late String albuminResult, prealbuminResult, interventionResult;

  late double ibw;

  // final _fkDp1 = GlobalKey<FormState>();
  final formatter = NumberFormat.decimalPattern();

  List<String> sex = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    translate("gantt_chart.perio_page.male"),
    translate("gantt_chart.perio_page.female"),
  ];

  List<String> ckdStage = <String>[
    translate("gantt_chart.perio_page.select_sex"),
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
    translate("gantt_chart.perio_page.select_sex"),
    '25',
    '30',
    '35',
  ];

  List<String> protienGoal = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    '0.6',
    '0.7',
    '0.8',
    '0.9',
    '1',
    '1.1',
    '1.2'
  ];

  List<String> renalReplacement = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    translate("gantt_chart.dialysis_page.peritoneal"),
    translate("assesment_page.table_head_no"),
    translate("gantt_chart.dialysis_page.hemo"),
    translate("gantt_chart.dialysis_page.peritoneal"),
    translate("gantt_chart.dialysis_page.transplantation"),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        title: translate("gantt_chart.dialysis_page.dialysis_patient"),
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
                          content: 'Case Information 1',
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
                              DashedLine(width: width),
                              CurveCalculateResult(
                                width: width,
                                title: "BMI",
                                result: "BMI Result",
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: "IBW",
                                result: "IBW Result",
                              ),
                              DashedLine(width: width),
                              CurveFormField(
                                title:
                                    translate("gantt_chart.dialysis_page.eGFR"),
                                controller: egfrController,
                                controllerFocus: egfrFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    egfrValue = egfrController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              CurveDropDown(
                                title: translate(
                                    "gantt_chart.dialysis_page.ckd_stage"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    ckdValue = v!;
                                  });
                                },
                                v: ckdStage,
                              ),
                              CurveDropDown(
                                title: translate(
                                    "gantt_chart.dialysis_page.renal_replacement"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    renalValue = v!;
                                  });
                                },
                                v: renalReplacement,
                              ),
                            ],
                          ),
                        ),
                        HeaderWithCircleAvatar(
                          header: 'Info',
                          content: 'Case Infomation 2',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.energy_daily"),
                                controller: energyController,
                                controllerFocus: energyFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    edValue = energyController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.protein_daily"),
                                controller: proteinController,
                                controllerFocus: proteinFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    pdValue = proteinController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              DashedLine(width: width),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.energy_intake"),
                                result: "protein daily Result",
                                axis: "col",
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.protein_intake"),
                                result: "protein daily Result",
                                axis: "col",
                              ),
                              DashedLine(width: width),
                              CurveDropDown(
                                title: translate("gantt_chart.energy_goal"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    renalValue = v!;
                                  });
                                },
                                v: renalReplacement,
                              ),
                              CurveDropDown(
                                title: translate("gantt_chart.protien_goal"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    renalValue = v!;
                                  });
                                },
                                v: renalReplacement,
                              ),
                              DashedLine(width: width),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.perio_page.energy_daily"),
                                result: "protein daily Result",
                                axis: "col",
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.perio_page.protein_daily"),
                                result: "protein daily Result",
                                axis: "col",
                              ),
                              DashedLine(width: width),
                            ],
                          ),
                        ),
                        HeaderWithCircleAvatar(
                          header: 'NP',
                          content: 'Nutrition parameter (Baseline)',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              CurveCalculateResult(
                                width: width,
                                title: "BMI",
                                result: "BMI Result",
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: "IBW",
                                result: "IBW Result",
                              ),
                              DashedLine(width: width),
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.serum_albumin"),
                                controller: proteinController,
                                controllerFocus: proteinFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    pdValue = proteinController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.serum_prealbumin"),
                                controller: proteinController,
                                controllerFocus: proteinFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    pdValue = proteinController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        HeaderWithCircleAvatar(
                          header: 'NP',
                          content: 'Nutrition parameter (Follow-up)',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.intervention_duration"),
                                controller: proteinController,
                                controllerFocus: proteinFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    pdValue = proteinController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.actual_weight"),
                                controller: proteinController,
                                controllerFocus: proteinFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    pdValue = proteinController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              CurveCalculateResult(
                                isFollowUp: true,
                                width: width,
                                title: "Follow-up BMI (kg/m2)",
                                result: "BMI Result",
                              ),
                              DashedLine(width: width),
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.serum_albumin"),
                                controller: proteinController,
                                controllerFocus: proteinFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    pdValue = proteinController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.serum_prealbumin"),
                                controller: proteinController,
                                controllerFocus: proteinFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    pdValue = proteinController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return translate("validate.empty");
                                  }
                                  return null;
                                },
                              ),
                              DashedLine(width: width),
                              CurveCalculateResult(
                                isFollowUp: true,
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.diff_body_weight"),
                                result: "IBW Result",
                              ),
                              CurveCalculateResult(
                                isFollowUp: true,
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.diff_sr_albumin"),
                                result: "IBW Result",
                              ),
                              CurveCalculateResult(
                                isFollowUp: true,
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.diff_sr_prealbumin"),
                                result: "IBW Result",
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
