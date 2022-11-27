import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:msa_app/models/models.dart';

import '../../theme/theme.dart';
import '../shared/globals/user_manual.dart';
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
  static const defaultWeight = 0.0;
  static const defalutHight = 0.0;
  static const defalutEgfr = 0.0;
  static const defaultEnergy = 0.0;
  static const defalutProtein = 0.0;
  static const defalutAlbumin = 0.0;
  static const defaultPreAlbumin = 0.0;
  static const defalutIntervention = 0.0;
  static const defalutFollowUpActual = 0.0;
  static const defaultAlbuminFollowUp = 0.0;
  static const defalutPreAlbuminFollowUp = 0.0;

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController egfrController = TextEditingController();
  final TextEditingController energyController = TextEditingController();
  final TextEditingController proteinController = TextEditingController();
  final TextEditingController albuminController = TextEditingController();
  final TextEditingController prealbuminController = TextEditingController();
  final TextEditingController interventionController = TextEditingController();
  final TextEditingController followUpActController = TextEditingController();
  final TextEditingController albuFollowUpController = TextEditingController();
  final TextEditingController prealbuFollowUpController =
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
  final formatter = NumberFormat.decimalPattern();

  String sexValue = "";
  String egValue = "";
  String pgValue = "";
  String ckdValue = "";
  String renalValue = "";

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

  double _weight = defaultWeight;
  double _hight = defalutHight;
  // ignore: unused_field
  double _egfr = defalutEgfr;
  double _energy = defaultEnergy;
  double _protein = defalutProtein;
  double _albumin = defalutAlbumin;
  double _prealbumin = defaultPreAlbumin;
  // ignore: unused_field
  double _intervention = defalutIntervention;
  double _followUp = defalutFollowUpActual;
  double _albuminFollowUp = defaultAlbuminFollowUp;
  double _prealbuminFollowUp = defalutPreAlbuminFollowUp;

  late HtmlResultDialysisCalculateForm rdf;
  String energyGoalPrint = "";
  String protienGoalPrint = "";
  String energyRequirementPrint = "";
  String protienRequirementPrint = "";
  String sexPrint = "";
  String datePrint = "";
  String weightPrint = "";
  String heightPrint = "";
  String bmiPrint = "";
  String ibwPrint = "";
  String albuminBaselinePrint = "";
  String albuminFollowUpPrint = "";
  String ckdStagePrint = "";
  String diffAlbuminPrint = "";
  String diffBodyWeightPrint = "";
  String diffPreAlbuminPrint = "";
  String egfrPrint = "";
  String energyDiaryIntakePrint = "";
  String energyIntakePrint = "";
  String followUpActualWeightPrint = "";
  String followUpBMIPrint = "";
  String interventionPrint = "";
  String preAlbuminBaselinePrint = "";
  String preAlbuminFollowUpPrint = "";
  String protienDiaryIntakePrint = "";
  String protienIntakePrint = "";
  String renalReplacementPrint = "";

  var now = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    weightController.addListener(_onWeightChanged);
    heightController.addListener(_onHightChanged);
    egfrController.addListener(_onEgfrChanged);
    energyController.addListener(_onEnergyChanged);
    proteinController.addListener(_onProteinChanged);
    albuminController.addListener(_onAlbuminChanged);
    prealbuminController.addListener(_onPreAlbuminChanged);
    interventionController.addListener(_onInterventionChanged);
    followUpActController.addListener(_onFollowUpChanged);
    albuFollowUpController.addListener(_onAlbuminFollowUpChanged);
    prealbuFollowUpController.addListener(_onPreAlbuminFollowUpChanged);
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

  _onEgfrChanged() {
    setState(() {
      _egfr = double.tryParse(egfrController.text) ?? 0.0;
    });
  }

  _onEnergyChanged() {
    setState(() {
      _energy = double.tryParse(energyController.text) ?? 0.0;
    });
  }

  _onProteinChanged() {
    setState(() {
      _protein = double.tryParse(proteinController.text) ?? 0.0;
    });
  }

  _onAlbuminChanged() {
    setState(() {
      _albumin = double.tryParse(albuminController.text) ?? 0.0;
    });
  }

  _onPreAlbuminChanged() {
    setState(() {
      _prealbumin = double.tryParse(prealbuminController.text) ?? 0.0;
    });
  }

  _onInterventionChanged() {
    setState(() {
      _intervention = double.tryParse(interventionController.text) ?? 0.0;
    });
  }

  _onFollowUpChanged() {
    setState(() {
      _followUp = double.tryParse(followUpActController.text) ?? 0.0;
    });
  }

  _onAlbuminFollowUpChanged() {
    setState(() {
      _albuminFollowUp = double.tryParse(albuFollowUpController.text) ?? 0.0;
    });
  }

  _onPreAlbuminFollowUpChanged() {
    setState(() {
      _prealbuminFollowUp =
          double.tryParse(prealbuFollowUpController.text) ?? 0.0;
    });
  }

  double ibw = 0;
  double energyDaily = 0;
  double followUp = 0;

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

        weightPrint = _weight.toString();
        heightPrint = _hight.toString();
        bmiPrint = res;
        break;

      case "ibw":
        var t = translate("gantt_chart.perio_page.male");
        var ideal = 0;
        sexValue == t ? ideal = 100 : ideal = 105;
        ibw = _hight - ideal;
        String inString = ibw.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = "$result (kg.)";

        sexPrint = sexValue;
        ibwPrint = res;
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

        energyGoalPrint = egValue;
        energyRequirementPrint = res;
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

        protienGoalPrint = egValue;
        protienRequirementPrint = res;
        break;

      case "energy_intake":
        var ei = (_energy / ibw);
        String inString = ei.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = "$result (kCal/kg/day)";
        energyIntakePrint = _energy.toString();
        energyDiaryIntakePrint = res;
        break;

      case "protein_intake":
        var ei = (_protein / ibw);
        String inString = ei.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = "$result (g/kg/day)";
        protienIntakePrint = _protein.toString();
        protienDiaryIntakePrint = res;
        break;

      case "follow_up_bmi":
        followUp = _followUp / ((_hight / 100) * (_hight / 100));
        String inString = followUp.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = result;

        followUpActualWeightPrint = _followUp.toString();
        followUpBMIPrint = res;
        break;

      case "diff_of_body_weight":
        var diffBW = ((_followUp - _weight) / _weight) * 100;
        String inString = diffBW.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = "$result %";
        diffBodyWeightPrint = res;
        break;

      case "diff_of_sr_albumin":
        var diffSAbumin = ((_albuminFollowUp - _albumin) / _albumin) * 100;
        String inString = diffSAbumin.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = "$result %";
        diffAlbuminPrint = res;
        break;

      case "diff_of_sr_prealbumin":
        var diffSAbumin =
            ((_prealbuminFollowUp - _prealbumin) / _prealbumin) * 100;
        String inString = diffSAbumin.toStringAsFixed(2);
        var result = formatter.format(double.parse(inString));

        result == "NaN" || result == "∞" || result == "-105" || result == "-100"
            ? res = "-"
            : res = "$result %";

        preAlbuminFollowUpPrint = _prealbuminFollowUp.toString();
        diffPreAlbuminPrint = res;
        break;

      default:
        res = "-";
    }

    albuminBaselinePrint = _albumin.toString();
    albuminFollowUpPrint = _albuminFollowUp.toString();
    ckdStagePrint = ckdValue;
    egfrPrint = _egfr.toString();
    interventionPrint =
        _intervention.toString() + translate("gantt_chart.dialysis_page.week");
    renalReplacementPrint = renalValue;

    return res;
  }

  @override
  void dispose() {
    weightController.dispose();
    heightController.dispose();
    egfrController.dispose();
    energyController.dispose();
    proteinController.dispose();
    albuminController.dispose();
    prealbuminController.dispose();
    interventionController.dispose();
    followUpActController.dispose();
    albuFollowUpController.dispose();
    prealbuFollowUpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    rdf = HtmlResultDialysisCalculateForm(
      energyGoal: energyGoalPrint,
      protienGoal: protienGoalPrint,
      energyRequirement: energyRequirementPrint,
      protienRequirement: protienRequirementPrint,
      sex: sexPrint,
      date: datePrint,
      weight: weightPrint,
      height: heightPrint,
      bmi: bmiPrint,
      ibw: ibwPrint,
      albuminBaseline: albuminBaselinePrint,
      albuminFollowUp: albuminFollowUpPrint,
      ckdStage: ckdStagePrint,
      diffAlbumin: diffAlbuminPrint,
      diffBodyWeight: diffBodyWeightPrint,
      diffPreAlbumin: diffPreAlbuminPrint,
      egfr: egfrPrint,
      energyDiaryIntake: energyDiaryIntakePrint,
      energyIntake: energyIntakePrint,
      protienDiaryIntake: protienDiaryIntakePrint,
      protienIntake: protienIntakePrint,
      followUpActualWeight: followUpActualWeightPrint,
      followUpBMI: followUpBMIPrint,
      intervention: interventionPrint,
      preAlbuminBaseline: preAlbuminBaselinePrint,
      preAlbuminFollowUp: preAlbuminFollowUpPrint,
      renalReplacement: renalReplacementPrint,
    );

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
            builder: (BuildContext context) => UserManual(
                  context: context,
                  indexImageList: 4,
                  textContents:
                      'Description : Case Information\n1. On this page, the user must complete the information according to the topic.\n2. After filling out the information, press the Continue button to fill out the next topic.',
                )),
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
                          content:
                              translate("gantt_chart.dialysis_page.title_1"),
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
                              DashedLine(width: width),
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
                                onChanged: (v) {},
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
                          content:
                              translate("gantt_chart.dialysis_page.title_2"),
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
                                onChanged: (v) {},
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
                                onChanged: (v) {},
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
                                result: _calculated("energy_intake"),
                                axis: "col",
                              ),
                              CurveCalculateResult(
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.protein_intake"),
                                result: _calculated("protein_intake"),
                                axis: "col",
                              ),
                              DashedLine(width: width),
                              CurveDropDown(
                                title: translate("gantt_chart.energy_goal"),
                                width: width,
                                onChanged: (String? v) {
                                  setState(() {
                                    egValue = v!;
                                  });
                                },
                                v: energyGoal,
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
                              DashedLine(width: width),
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
                              DashedLine(width: width),
                            ],
                          ),
                        ),
                        HeaderWithCircleAvatar(
                          header: 'NP',
                          content:
                              translate("gantt_chart.dialysis_page.title_3"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
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
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.serum_albumin"),
                                controller: albuminController,
                                controllerFocus: albuminFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {},
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
                                controller: prealbuminController,
                                controllerFocus: prealbuminFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {},
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
                          content:
                              translate("gantt_chart.dialysis_page.title_4"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            children: [
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.intervention_duration"),
                                controller: interventionController,
                                controllerFocus: interventionFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {},
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
                                controller: followUpActController,
                                controllerFocus: followUpActualFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {},
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
                                result: _calculated("follow_up_bmi"),
                              ),
                              DashedLine(width: width),
                              CurveFormField(
                                title: translate(
                                    "gantt_chart.dialysis_page.serum_albumin"),
                                controller: albuFollowUpController,
                                controllerFocus: albuminFollowUpFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {},
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
                                controller: prealbuFollowUpController,
                                controllerFocus: prealbuminFollowUpFocus,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      numberRegExp)
                                ],
                                hint: translate("gantt_chart.fill_info"),
                                onChanged: (v) {},
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
                                result: _calculated("diff_of_body_weight"),
                              ),
                              CurveCalculateResult(
                                isFollowUp: true,
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.diff_sr_albumin"),
                                result: _calculated("diff_of_sr_albumin"),
                              ),
                              CurveCalculateResult(
                                isFollowUp: true,
                                width: width,
                                title: translate(
                                    "gantt_chart.dialysis_page.diff_sr_prealbumin"),
                                result: _calculated("diff_of_sr_prealbumin"),
                              ),
                            ],
                          ),
                        ),
                        msaSizeBox(height: 30),
                        Container(
                          color: primaryColor,
                          height: 50,
                          width: width,
                          child: PrintPdf(
                            rdcf: rdf,
                            type: 'dpc',
                          ),
                        ),
                        msaSizeBox(),
                        Container(
                          color: primaryColor4,
                          height: 50,
                          width: width,
                          child: TextButton(
                            onPressed: () => {
                              setState(
                                () {
                                  weightController.clear();
                                  heightController.clear();
                                  egfrController.clear();
                                  energyController.clear();
                                  proteinController.clear();
                                  albuminController.clear();
                                  prealbuminController.clear();
                                  interventionController.clear();
                                  followUpActController.clear();
                                  albuFollowUpController.clear();
                                  prealbuFollowUpController.clear();
                                },
                              )
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
