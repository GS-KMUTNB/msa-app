import 'package:flutter/material.dart';
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
  int _index = 0;
  String bmiValue = "";
  int val = -1;

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

    var fromOne = <Step>[
      Step(
        title: bmiValue == "test" ? Text('BMI Calculator') : Text("data"),
        subtitle: bmiValue == "test"
            ? Text("please input your weight and height for calculate your BMI")
            : Text("your BMI"),
        content: BmiForm(
          heightController: heightController,
          hightFocus: hightFocus,
          weightController: weightController,
          weightFocus: weightFocus,
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
                child: Container(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: ListView(
                    controller: _controller,
                    children: [
                      // ignore: fixme
                      MsaProgressBar(), //FIXME add logic for progressbar
                      msaSizeBox(height: 10),
                      MsaStepper(
                        context: context,
                        currentStep: _index,
                        onStepCancel: () {
                          if (_index > 0) {
                            setState(() {
                              _index -= 1;
                            });
                          }
                        },
                        onStepContinue: () {
                          print(_index);
                          if (_index < (fromOne.length - 1)) {
                            setState(() {
                              _index += 1;
                            });
                          }

                          if (_index == 1) {
                            setState(() {
                              bmiValue = "test";
                            });
                            print("index 1 naja");
                          }
                        },
                        onStepTapped: (int index) {
                          setState(() {
                            _index = index;
                          });
                        },
                        steps: fromOne,
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
