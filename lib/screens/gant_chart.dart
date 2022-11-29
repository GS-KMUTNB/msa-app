import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/screens/screens.dart';
import 'package:msa_app/shared/shared.dart';

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
        haveTutor: false,
        title: translate("gantt_chart.title"),
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
            title: 'Warning!!!',
            width: width,
            height: height / 2,
            onPressedYes: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false);
            },
            onPressedNo: () {
              Navigator.pop(context);
            },
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
                      SizedBox(
                        child: AutoSizeText(
                          translate("gantt_chart.select"),
                          style: subtitle1,
                          minFontSize: 12,
                          maxFontSize: 18,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      msaSizeBox(height: 20),
                      MsaButton(
                        text: translate("gantt_chart.perioperative_button"),
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
                        text: translate("gantt_chart.dialysis"),
                        textStyle: whiteText,
                        color: primaryColor1,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DialysisPatientScreen(
                                buildContext: context,
                              ),
                            ),
                          );
                        },
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
