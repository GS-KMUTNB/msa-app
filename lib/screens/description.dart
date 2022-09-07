import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
        ctx: context,
        title: "Assessment",
        onPressed: () {
          Navigator.pop(context);
        },
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
                    const AutoSizeText(
                      "Description : To make a screening Nutritional Status Assessment Model Information is required. \n- Weight\n- Height A section to use to calculate your body mass index (BMI) and have questions for you to do. Answer by choosing to answer in 2 cases, yes and no.",
                      style: bodyText1,
                      maxLines: 10,
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
                        color: primaryColor4,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AssessmentScreen(),
                            ),
                          );
                        },
                        text: 'Start screening nutrition',
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
