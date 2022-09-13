import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msa_app/screens/result.dart';
import 'package:msa_app/shared/shared.dart';

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

  String wValue = "";
  String hValue = "";
  bool haveBMIValue = false;

  var rdValue = ["Yes", "No"];
  var radioResult = "";
  List<String> result = [];

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

  Color colorCondition(String value) {
    var color = const Color.fromARGB(73, 0, 0, 0);

    switch (value) {
      case "Yes":
        color = Colors.green;
        break;

      case "No":
        color = Colors.red;
        break;

      default:
        color = const Color.fromARGB(73, 0, 0, 0);
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    // print("weight: " + wValue);
    // print("height: " + hValue);

// ignore: fixme
//FIXME in future next step add dynamic stepper
    var fromOne = <Step>[
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
        subtitle: const Text(
            "Are you sure? to be sent for evaluation. Click CONTINUE continue for check result and CANCEL for back to answer"),
        content: const SizedBox(),
      ),
    ];

    // print(result);

    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        ctx: context,
        title: "Assessment",
        onPressed: () {
          Navigator.pop(context);
        },
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
                                    // print(wD);
                                    // print(hD);

                                    // print(bmiValue);
                                  });
                                }

                                if (_index < (fromOne.length - 1)) {
                                  // To next Step
                                  setState(() {
                                    _index += 1;

                                    if (radioResult != "") {
                                      result.add(radioResult);
                                    }
                                  });
                                }

                                if (_index == 5) {
                                  // To next Step
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResultScreen(
                                          data: result,
                                        ),
                                      ),
                                    );
                                  });
                                }
                              } else {
                                // print("not pass !");
                              }
                            },
                            //*on tab
                            onStepTapped: (int index) => null,
                            steps: fromOne,
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
