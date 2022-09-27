import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msa_app/shared/shared.dart';

import '../shared/gantt_chart/perioperative_patient.dart';
import '../shared/globals/alert_hint.dart';
import '../theme/theme.dart';

class GanttChartScreen extends StatelessWidget {
  const GanttChartScreen({
    Key? key,
    BuildContext? context,
    required BuildContext buildContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MsaAppBar(
        haveTutor: true,
        title: 'GANTT CHART Energy & Protein Intake Calculator',
        ctx: context,
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
            onPressedNo: () {
              Navigator.pop(context);
            },
          ),
        ),
        onPressedHint: () => showDialog<String>(
          context: context,
          //FIXME waiting design
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
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: AutoSizeText(
                          "Select the GANTT CHART Energy & Protein Intake Calculator.",
                          style: subtitle1,
                          minFontSize: 12,
                          maxFontSize: 18,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      msaSizeBox(height: 20),
                      MsaButton(
                        text: 'Perioperative patient',
                        textStyle: whiteText,
                        color: primaryColor1,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PerioperativePatientScreen(
                                buildContext: context,
                              ),
                            ),
                          );
                        },
                      ),
                      msaSizeBox(height: 20),
                      MsaButton(
                        text: 'Dialysis patient',
                        textStyle: whiteText,
                        color: primaryColor1,
                        onPressed: () {},
                      )
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
