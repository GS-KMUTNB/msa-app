import 'package:flutter/material.dart';
import 'package:msa_app/shared/shared.dart';

import '../../theme/theme.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  final TextEditingController weightController = TextEditingController();
  final FocusNode weightFocus = FocusNode();

  final TextEditingController heightController = TextEditingController();
  final FocusNode hightFocus = FocusNode();

  final _controller = ScrollController();
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

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
                  padding: const EdgeInsets.all(20.0),
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
                          if (_index <= 0) {
                            setState(() {
                              _index += 1;
                            });
                          }
                        },
                        onStepTapped: (int index) {
                          setState(() {
                            _index = index;
                          });
                        },
                        steps: <Step>[
                          Step(
                            title: const Text('BMI Calculator'),
                            subtitle: const Text(
                              "please input your weight and height for calculate your BMI",
                            ),
                            content: BmiForm(
                              heightController: heightController,
                              hightFocus: hightFocus,
                              weightController: weightController,
                              weightFocus: weightFocus,
                            ),
                          ),
                          const Step(
                            title: Text('Step 2 title'),
                            content: Text('Content for Step 2'),
                          ),
                          const Step(
                            title: Text('Step 3 title'),
                            content: Text('Content for Step 3'),
                          ),
                          const Step(
                            title: Text('Step 4 title'),
                            content: Text('Content for Step 4'),
                          ),
                          const Step(
                            title: Text('Step 5 title'),
                            content: Text('Content for Step 5'),
                          ),
                        ],
                      ),
                      msaSizeBox(height: 250),
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
