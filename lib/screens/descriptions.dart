import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/screens/screens.dart';
import 'package:msa_app/shared/shared.dart';

import '../theme/theme.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return MsaScaffold(
      appbar: MsaAppBar(
        haveTutor: false,
        ctx: context,
        title: translate("manual_select_menu.title"),
        onPressed: () {
          Navigator.pop(context);
        },
        onPressedHint: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
            haveButton: true,
            haveQuestions: true,
            continueButton: true,
            warningQuestions: true,
            title: 'Screening results',
            numberQuestions: "3 Questions.",
            textContent:
                "Your screening result is \n- Continue the nutritional assessment. or consult a dietitian/nutrition team",
          ),
        ),
      ),
      bgImage: "bg.png",
      body: [
        Center(
          child: CardContent(
            w: width - 40,
            h: height / 1.20,
            color: Colors.white,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    msaSizeBox(height: 30),
                    AutoSizeText(
                      translate("manual_select_menu.description_select_menu"),
                      style: bodyText1,
                      maxLines: 12,
                      textAlign: TextAlign.left,
                    ),
                    msaSizeBox(height: 30),
                    Row(children: <Widget>[
                      Expanded(
                        child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: const Divider(
                              color: primaryColor4,
                              height: 36,
                              thickness: 3,
                            )),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: MsaButton(
                        color: Colors.green,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AssessmentScreen(),
                            ),
                          );
                        },
                        text: translate(
                            "manual_select_menu.button_start_screening"),
                        textStyle: bodyText1,
                        h: 120,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
