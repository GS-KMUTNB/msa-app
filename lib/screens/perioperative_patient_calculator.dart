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

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController actualOralController = TextEditingController();
  final FocusNode weightFocus = FocusNode();
  final FocusNode hightFocus = FocusNode();
  final FocusNode actualOralFocus = FocusNode();
  final _controller = ScrollController();
  final formatter = NumberFormat.decimalPattern();
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  String sexValue = "";
  String egValue = "";
  String pgValue = "";

  bool haveBMIValue = false;
  bool haveDrValue = false;

  List<String> sex = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    translate("gantt_chart.perio_page.male"),
    translate("gantt_chart.perio_page.female")
  ];
  List<String> energyGoal = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    '20',
    '25',
    '30',
    '35',
    '40'
  ];
  List<String> protienGoal = <String>[
    translate("gantt_chart.perio_page.select_sex"),
    '1.0',
    '1.2',
    '1.3',
    '1.4',
    '1.5'
  ];

  double _weight = defaultWeight;
  double _hight = defalutHight;
  double _actualOral = defalutActualOral;

  double ibw = 0;
  double energyDaily = 0;

  @override
  void initState() {
    super.initState();
    weightController.addListener(_onWeightChanged);
    heightController.addListener(_onHightChanged);
    actualOralController.addListener(_onActualOralChanged);
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

  _onActualOralChanged() {
    setState(() {
      _actualOral = double.tryParse(actualOralController.text) ?? 0.0;
    });
  }

  String _calculated(String type) {
    var res = "";
    switch (type) {
      case "bmi":
        var bmi = (_weight / pow(_hight / 100, 2));
        String inString = bmi.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞"
            ? res = "-"
            : res = "$result (kg./m^2)";
        break;

      case "ibw":
        var ideal = 0;
        sexValue == "Male" ? ideal = 100 : ideal = 105;
        ibw = _hight - ideal;
        String inString = ibw.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = "$result (kg.)";
        break;

      case "energy_daily_requirement":
        var t = translate("gantt_chart.perio_page.select_sex");

        if (egValue == t || egValue == "") {
          res = "-";
        } else {
          var eg = double.parse(egValue);
          energyDaily = eg * ibw;
          String inString = energyDaily.toStringAsFixed(2);
          var result = formatter.format(double.parse(inString));
          res = "$result (kcal)";
        }
        break;

      case "protein_daily_requirement":
        var t = translate("gantt_chart.perio_page.select_sex");

        if (pgValue == t || pgValue == "") {
          res = "-";
        } else {
          var pg = double.parse(pgValue);
          var edr = pg * ibw;
          String inString = edr.toStringAsFixed(2);
          var result = formatter.format(double.parse(inString));

          res = "$result (g)";
        }
        break;

      case "actual_energy_intake_vs_requirement":
        var aei = (_actualOral / energyDaily) * 100;

        String inString = aei.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));
        result == "NaN" || result == "∞" || result == "-0"
            ? res = "-"
            : res = "$result %";

        break;

      default:
        res = "-";
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
                                onWeightChanged: (v) {},
                                onHeightChanged: (v) {},
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
                                result: _calculated("bmi"),
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: "IBW",
                                result: _calculated("ibw"),
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
                                v: energyGoal,
                                onChanged: (String? v) {
                                  setState(() {
                                    egValue = v!;
                                  });
                                },
                              ),
                              CurveDropDown(
                                title: translate("gantt_chart.protien_goal"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    pgValue = v!;
                                  });
                                },
                                v: protienGoal,
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.perio_page.energy_daily"),
                                result: _calculated("energy_daily_requirement"),
                                axis: "col",
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.perio_page.protein_daily"),
                                result:
                                    _calculated("protein_daily_requirement"),
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
                                onChanged: (v) {},
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
                                result: _calculated(
                                    "actual_energy_intake_vs_requirement"),
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
                            onPressed: () => {
                              setState(() {
                                weightController.clear();
                                heightController.clear();
                                actualOralController.clear();
                              })
                            },
                            child: const Text(
                              "Reset",
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
