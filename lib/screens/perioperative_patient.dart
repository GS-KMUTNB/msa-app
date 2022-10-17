import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:msa_app/screens/screens.dart';
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
  final _fkPerio1 = GlobalKey<FormState>();
  final _fkPerio2 = GlobalKey<FormState>();
  final formatter = NumberFormat.decimalPattern();

  int _index = 0;

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

    var getStep = <Step>[
      Step(
        isActive: true,
        title: haveBMIValue
            ? DisplayResultStep(
                type: "case_infomation",
                width: width,
                bmi: bmiValue,
                ibw: ibwValue,
                sex: sexValue,
              )
            : AutoSizeText(
                translate("gantt_chart.perio_page.title_1"),
                minFontSize: 16,
                maxLines: 1,
              ),
        content: Form(
          key: _fkPerio1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  translate("gantt_chart.sex"),
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
                msaSizeBox(height: 10),
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
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: (_index >= 1) ? true : false,
        title: haveDrValue
            ? DisplayResultStep(
                type: "daily_requirement",
                width: width,
                energy: edResult,
                protein: pdResult,
                actual: aeResult,
              )
            : AutoSizeText(
                translate("gantt_chart.perio_page.title_2"),
                minFontSize: 16,
                maxLines: 1,
              ),
        content: Form(
          key: _fkPerio2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  translate("gantt_chart.energy_goal"),
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
                          edValue = v!;
                        });
                      },
                      v: energy,
                    )),
                msaSizeBox(height: 10),
                AutoSizeText(
                  translate("gantt_chart.protien_goal"),
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
                          pdValue = v!;
                        });
                      },
                      v: protien,
                    )),
                msaSizeBox(height: 10),
                AutoSizeText(
                  translate("gantt_chart.energy_intake"),
                  minFontSize: 14,
                  maxLines: 1,
                ),
                msaSizeBox(),
                MsaFormField(
                  controller: actualOralController,
                  controllerFocus: actualOralFocus,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(numberRegExp)
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
              ],
            ),
          ),
        ),
      ),
      Step(
        isActive: (_index >= 2) ? true : false,
        title: Text(translate("gantt_chart.perio_page.summary")),
        subtitle: Text(translate("gantt_chart.perio_page.check_result")),
        content: msaSizeBox(),
      )
    ];

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
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 5, left: 5),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          controller: _controller,
                          children: [
                            MsaStepper(
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
                                    haveDrValue = false;
                                  });
                                }
                              },
                              //*continue
                              onStepContinue: () {
                                var lastStep = _index == getStep.length - 1;

                                if (_fkPerio1.currentState!.validate() ||
                                    _fkPerio2.currentState!.validate()) {
                                  if (_index <= getStep.length - 1) {
                                    // To next Step
                                    if (_index == 0) {
                                      setState(() {
                                        haveBMIValue = true;
                                        _fkPerio1.currentState?.reset();
                                        _fkPerio2.currentState?.reset();

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
                                        haveDrValue = true;
                                        _fkPerio1.currentState?.reset();
                                        _fkPerio2.currentState?.reset();

                                        var ao = double.parse(acValue);
                                        var edRaw = double.parse(edValue);
                                        var pdRaw = double.parse(pdValue);

                                        ed = calculateGanttChart(
                                            "ed", edRaw, ibw);
                                        pd = calculateGanttChart(
                                            "pd", pdRaw, ibw);
                                        ae = calculateGanttChart("ae", ao, ed);

                                        edResult = formatter.format(ed);
                                        pdResult = formatter.format(pd);
                                        aeResult = formatter.format(ae);

                                        _index += 1;
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GanttChartTodoScreen(
                                        data: const [],
                                        context: context,
                                      ),
                                    ),
                                  );
                                }
                              },
                              //*on tab
                              onStepTapped: (int index) => null,
                              steps: getStep,
                            ),
                          ],
                        ),
                      ),
                    ],
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
