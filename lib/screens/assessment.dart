import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:msa_app/screens/result.dart';
import 'package:msa_app/shared/shared.dart';
import 'package:msa_app/theme/theme.dart';

import '../models/models.dart';
import '../shared/globals/alert_hint.dart';

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

  bool lastStep = false;

  var rdValue = ["Yes", "No"];
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

    var countData = data.formData!.where((c) => c == "Yes").length;

    var formOne = <Step>[
      Step(
        isActive: true,
        title: haveBMIValue
            ? Text(
                "BMI: $bmiValue",
              )
            : const Text('BMI Calculator'),
        subtitle: haveBMIValue
            ? AutoSizeText(
                "Result: $resultBmi $interpreBmi",
                minFontSize: 14,
                maxLines: 2,
              )
            : const Text(
                "please input your weight and height for calculate your BMI"),
        content: BmiForm(
          stepperKey: _formKey,
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
      ),
      Step(
        isActive: (_index >= 1) ? true : false,
        title: const Text(
            'The patient had an unintentional weight loss in During the past 6 months?'),
        subtitle: _index >= 2
            ? RichText(
                text: TextSpan(
                  style: head6,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'choose :',
                    ),
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
            : const Text(''),
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
        title:
            const Text('Patients were fed less than they used to (> 7 days).'),
        subtitle: _index >= 3
            ? RichText(
                text: TextSpan(
                  style: head6,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'choose :',
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
            : const Text(''),
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
        isActive: (_index >= 3) ? true : false,
        title: const Text('BMI < 18.5 or > = 25.0 kg/m2?'),
        subtitle: _index >= 4
            ? RichText(
                text: TextSpan(
                  style: head6,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'choose :',
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
            : const Text(''),
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
        isActive: (_index >= 4) ? true : false,
        title:
            const Text('Patients with critical illness or semi-crisis. or not'),
        subtitle: _index >= 5
            ? RichText(
                text: TextSpan(
                  style: head6,
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'choose :',
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
            : const Text(''),
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
        isActive: (_index >= 5) ? true : false,
        title: const Text('Confirm ?'),
        content: const SizedBox(),
      ),
    ];

    // print(result);

    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        ctx: context,
        title: "Assessment",
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
          ),
        ),
        onPressedHint: () => showDialog<String>(
          // ignore: fixme
          //FIXME PART GO
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 20, bottom: 10),
                      child: MsaProgressBar(),
                    ),
                    Expanded(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        controller: _controller,
                        children: [
                          MsaStepper(
                            // lastStep: lastStep,
                            context: context,
                            currentStep: _index,
                            //*cancel
                            onStepCancel: () {
                              if (_index > 0) {
                                setState(() {
                                  _index -= 1;

                                  result.remove(radioResult);
                                  radioResult = "";
                                });
                              }

                              if (_index == 0) {
                                setState(() {
                                  haveBMIValue = false;
                                });
                              }
                            },
                            //*continue
                            onStepContinue: () {
                              // print(_index);

                              if (_formKey.currentState!.validate()) {
                                // print("pass !");
                                if (_index == 0) {
                                  setState(() {
                                    haveBMIValue = true;

                                    var wD = double.parse(wValue);
                                    var hD = double.parse(hValue);
                                    var bmi = calculateBMI(wD, hD);

                                    bmiValue = bmi.toStringAsFixed(2);
                                    resultBmi = getResult(bmi);
                                    interpreBmi = getInterpretation(bmi);
                                  });
                                }

                                if (_index < (formOne.length - 1)) {
                                  // To next Step

                                  if (_index == 5) {
                                    setState(() {
                                      lastStep = true;
                                      if (radioResult != "") {
                                        result.add(radioResult);
                                      }
                                    });
                                  } else {
                                    setState(() {
                                      _index += 1;

                                      if (radioResult != "") {
                                        result.add(radioResult);
                                      }
                                    });
                                  }
                                }

                                if (_index == 5) {
                                  showDialog(
                                    // ignore: fixme
                                    context: context,
                                    builder: (BuildContext context) =>
                                        MsaHintAlert(
                                      context: context,
                                      haveButton: true,
                                      haveQuestions: true,
                                      continueButton: false,
                                      warningQuestions: true,
                                      have2Button: true,
                                      title: 'Screening results',
                                      numberQuestions: '$countData Questions.',
                                      textContent:
                                          "Your screening result is \n- Continue the nutritional assessment. or consult a dietitian/nutrition team",
                                      onPressedYes: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ResultScreen(data: data),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }
                              } else {
                                // print("not pass !");
                              }
                            },
                            //*on tab
                            onStepTapped: (int index) => null,
                            steps: formOne,
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
    );
  }
}
