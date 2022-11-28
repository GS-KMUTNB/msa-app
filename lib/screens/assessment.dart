import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:msa_app/screens/result.dart';
import 'package:msa_app/shared/globals/user_manual.dart';
import 'package:msa_app/shared/shared.dart';
import 'package:msa_app/theme/theme.dart';

import '../models/models.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  late TextEditingController weightController = TextEditingController();
  final FocusNode weightFocus = FocusNode();

  late TextEditingController heightController = TextEditingController();
  final FocusNode hightFocus = FocusNode();

  final _controller = ScrollController();
  final _formKey = GlobalKey<FormState>();

  int _index = 0;
  String bmiValue = "";
  String resultBmi = "";
  String interpreBmi = "";
  int step1 = -1;

  bool haveBMIValue = false;
  bool isHighRisk = false;

  var rdValue = [
    translate("assesment_page.table_head_yes"),
    translate("assesment_page.table_head_no")
  ];
  var radioResult = "";

  String wValue = "";
  String hValue = "";
  List<String> result = [];
  List<Color> resultColor = [];
  var now = DateFormat('dd-MM-yyyy').format(DateTime.now());

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

    var data = Screening(
      now,
      wValue,
      hValue,
      bmiValue,
      result,
    );

    var getStep = <Step>[
      Step(
        isActive: true,
        title: haveBMIValue
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(translate("assesment_page.description_bmi_range")),
                  Text(
                      "${translate("assesment_page.text_box_bmi")}: $bmiValue"),
                ],
              )
            : Text(translate("assesment_page.input_weight_height")),
        subtitle: haveBMIValue
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: translate("assesment_page.result"),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                        TextSpan(
                          text: " $resultBmi\n",
                          style: TextStyle(
                            fontSize: 14,
                            color: getResultColor(resultBmi),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: interpreBmi,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: head6,
                      children: <TextSpan>[
                        TextSpan(
                            text: "${translate("assesment_page.choose")} :",
                            style: const TextStyle()),
                        TextSpan(
                          text: ' ${result[0]}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorCondition(result[0]),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Text(
                translate("assesment_page.sub_input_weight_height"),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
        content: BmiForm(
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
              return translate("validate.empty");
            }
            return null;
          },
          inputFormattersHeight: [
            FilteringTextInputFormatter.allow(numberRegExp)
          ],
          validatorHeight: (String? val) {
            if (val == null || val.isEmpty) {
              return translate("validate.empty");
            }
            return null;
          },
        ),
      ),
      Step(
        isActive: (_index >= 1) ? true : false,
        title:
            Text(translate("assesment_page.description_assesment_weight_loss")),
        subtitle: _index >= 2
            ? RichText(
                text: TextSpan(
                  style: head6,
                  children: <TextSpan>[
                    TextSpan(
                      text: "${translate("assesment_page.choose")} :",
                    ),
                    TextSpan(
                      text: ' ${result[1]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorCondition(result[1]),
                      ),
                    ),
                  ],
                ),
              )
            : Text(translate("assesment_page.choose_yes_or_no")),
        content: CustomRadioButton(
          elevation: 0,
          absoluteZeroSpacing: true,
          unSelectedColor: Colors.transparent,
          buttonLables: rdValue,
          buttonValues: rdValue,
          selectedColor: colorCondition(radioResult),
          selectedBorderColor: colorCondition(radioResult),
          unSelectedBorderColor: const Color.fromARGB(73, 0, 0, 0),
          radioButtonValue: (value) {
            setState(() {
              radioResult = value.toString();
            });
          },
        ),
      ),
      Step(
        isActive: (_index >= 2) ? true : false,
        title: Text(translate(
            "assesment_page.description_assesment_Patients_were_fed_less")),
        subtitle: _index >= 3
            ? RichText(
                text: TextSpan(
                  style: head6,
                  children: <TextSpan>[
                    TextSpan(
                      text: "${translate("assesment_page.choose")} :",
                    ),
                    TextSpan(
                      text: ' ${result[2]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorCondition(result[2]),
                      ),
                    ),
                  ],
                ),
              )
            : Text(translate("assesment_page.choose_yes_or_no")),
        content: CustomRadioButton(
          elevation: 0,
          absoluteZeroSpacing: true,
          unSelectedColor: Colors.transparent,
          buttonLables: rdValue,
          buttonValues: rdValue,
          selectedColor: colorCondition(radioResult),
          selectedBorderColor: colorCondition(radioResult),
          unSelectedBorderColor: const Color.fromARGB(73, 0, 0, 0),
          radioButtonValue: (value) {
            setState(() {
              radioResult = value.toString();
            });
          },
        ),
      ),
      Step(
        isActive: (_index == 3) ? true : false,
        title: Text(
            translate("assesment_page.description_patients_with_critical")),
        subtitle: _index >= 4
            ? RichText(
                text: TextSpan(
                  style: head6,
                  children: <TextSpan>[
                    TextSpan(
                      text: "${translate("assesment_page.choose")} :",
                    ),
                    TextSpan(
                      text: ' ${result[3]}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorCondition(result[3]),
                      ),
                    ),
                  ],
                ),
              )
            : Text(translate("assesment_page.choose_yes_or_no")),
        content: CustomRadioButton(
          elevation: 0,
          absoluteZeroSpacing: true,
          unSelectedColor: Colors.transparent,
          buttonLables: rdValue,
          buttonValues: rdValue,
          selectedColor: colorCondition(radioResult),
          selectedBorderColor: colorCondition(radioResult),
          unSelectedBorderColor: const Color.fromARGB(73, 0, 0, 0),
          radioButtonValue: (value) {
            setState(() {
              radioResult = value.toString();
            });
          },
        ),
      ),
    ];

    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        ctx: context,
        title: translate("assessment_page_start.assessment"),
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
              Navigator.of(context).pop();
            },
          ),
        ),
        onPressedHint: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
                UserManual(context: context, indexImageList: 0, indexText: 0)),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
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
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          controller: _controller,
                          children: [
                            msaSizeBox(height: 20),
                            MsaStepper(
                              context: context,
                              currentStep: _index,
                              //*cancel
                              onStepCancel: () {
                                if (_index > 0) {
                                  setState(() {
                                    _index -= 1;

                                    if (_index > 1) {
                                      result.removeLast();
                                    }

                                    radioResult = "";
                                  });
                                }

                                if (_index == 1) {
                                  setState(() {
                                    result.clear();
                                    _index--;
                                  });
                                }

                                if (_index == 0) {
                                  setState(() {
                                    haveBMIValue = false;
                                    result = [];
                                  });
                                }
                              },
                              //*continue
                              onStepContinue: () {
                                if (_formKey.currentState!.validate()) {
                                  var lastStep = _index == getStep.length - 1;

                                  if (_index <= getStep.length - 1) {
                                    // To next Step
                                    if (_index == 0) {
                                      setState(() {
                                        haveBMIValue = true;

                                        var wD = double.parse(wValue);
                                        var hD = double.parse(hValue);
                                        var bmi = calculateBMI(wD, hD);

                                        bmiValue = bmi.toStringAsFixed(2);
                                        resultBmi = getResult(bmi);
                                        interpreBmi = getInterpretation(bmi);

                                        if (bmi < 18.5 || bmi >= 25.0) {
                                          result.add(translate(
                                              "assesment_page.table_head_yes"));
                                        } else {
                                          result.add(translate(
                                              "assesment_page.table_head_no"));
                                        }

                                        _index += 1;
                                      });
                                    } else {
                                      setState(() {
                                        if (radioResult != "") {
                                          if (!lastStep) {
                                            _index += 1;
                                            result.add(radioResult);
                                            radioResult = "";
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(translate(
                                                    "assesment_page.choose_yes_or_no"))),
                                          );
                                        }
                                      });
                                    }
                                  }

                                  if (_index == 3 && lastStep) {
                                    if (radioResult != "") {
                                      setState(() {
                                        result.add(radioResult);
                                      });

                                      var countData = data.formData!
                                          .where(
                                            (c) =>
                                                c ==
                                                translate(
                                                    "assesment_page.table_head_yes"),
                                          )
                                          .length;

                                      if (countData >= 2) {
                                        setState(() {
                                          isHighRisk = true;
                                        });
                                      } else {
                                        setState(() {
                                          isHighRisk = false;
                                        });
                                      }

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            MsaHintAlert(
                                          context: context,
                                          haveButton: true,
                                          haveQuestions: true,
                                          continueButton: false,
                                          warningQuestions: true,
                                          have2Button: true,
                                          isNotRedButton: false,
                                          title: translate(
                                              "alert_result.screening_result"),
                                          numberQuestions:
                                              '$countData ${translate("alert_result.questions")}.',
                                          textContent: isHighRisk
                                              ? "${translate("results_page.result_is")} \n- ${translate("results_page.continue_the_nutritional")} "
                                              : "${translate("results_page.result_is")} \n- ${translate("results_page.should_be_repeated")} ",
                                          isHightRisk: isHighRisk,
                                          onPressedYes: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ResultScreen(data: data),
                                              ),
                                            );
                                          },
                                          onPressedNo: () {
                                            result.removeLast();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      );
                                    }
                                  }
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
            ],
          ),
        ),
      ),
    );
  }
}
