import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msa_app/shared/shared.dart';
import '../../theme/theme.dart';

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
  int val = -1;
  String wValue = "";
  String hValue = "";
  bool haveBMIValue = false;

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

    // print("weight: " + wValue);
    // print("height: " + hValue);

    var fromOne = <Step>[
      // bmi: bmiValue,
      //                 resultBmi: resultBmi,
      //                 interpreBmi: interpreBmi,
      Step(
        title: haveBMIValue
            ? Text(
                "BMI: $bmiValue",
              )
            : const Text('BMI Calculator'),
        subtitle: haveBMIValue
            ? AutoSizeText(
                "Result: $resultBmi $interpreBmi",
                minFontSize: 12,
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
        title: const Text(
            'The patient had an unintentional weight loss in During the past 6 months?'),
        content: StepperRadioButton(
          groupValueNo: val,
          groupValueYes: val,
          onChangedNo: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          onChangedYes: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          width: width,
        ),
      ),
      Step(
        title:
            const Text('Patients were fed less than they used to (> 7 days).'),
        content: StepperRadioButton(
          groupValueNo: val,
          groupValueYes: val,
          onChangedNo: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          onChangedYes: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          width: width,
        ),
      ),
      Step(
        title: const Text('BMI < 18.5 or > = 25.0 kg/m2?'),
        content: StepperRadioButton(
          groupValueNo: val,
          groupValueYes: val,
          onChangedNo: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          onChangedYes: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          width: width,
        ),
      ),
      Step(
        title:
            const Text('Patients with critical illness or semi-crisis. or not'),
        content: StepperRadioButton(
          groupValueNo: val,
          groupValueYes: val,
          onChangedNo: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          onChangedYes: (v) {
            setState(() {
              int a = v as int;
              val = a;
            });
          },
          width: width,
        ),
      ),
    ];

    return Scaffold(
      appBar: MsaAppBar(
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
                      padding: const EdgeInsets.all(20.0),
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
                                  });
                                }
                              } else {
                                // print("not pass !");
                              }

                              // if (_index == 1) {
                              //   setState(() {
                              //     bmiValue = "test";
                              //   });
                              //   print("index 1 naja");
                              // }
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
