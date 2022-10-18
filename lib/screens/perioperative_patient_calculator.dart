import 'package:auto_size_text/auto_size_text.dart';
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
  late TextEditingController weightController = TextEditingController();
  final FocusNode weightFocus = FocusNode();

  late TextEditingController heightController = TextEditingController();
  final FocusNode hightFocus = FocusNode();

  late TextEditingController actualOralController = TextEditingController();
  final FocusNode actualOralFocus = FocusNode();

  final _controller = ScrollController();
  // final _fkPerio1 = GlobalKey<FormState>();

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

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
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
                              AutoSizeText(
                                translate("gantt_chart.energy_intake"),
                                minFontSize: 14,
                                maxLines: 1,
                              ),
                              MsaFormField(
                                controller: actualOralController,
                                controllerFocus: actualOralFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {
                                  setState(() {
                                    acValue = actualOralController.text;
                                  });
                                },
                                validator: (String? v) {
                                  if (v == null || v.isEmpty) {
                                    return 'Cannot empty';
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
