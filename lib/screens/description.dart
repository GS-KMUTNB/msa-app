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
        onPressedHint: () => showDialog<String>(
          // ignore: fixme
          //FIXME PART GO
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('AlertDialog Title'),
            content: Column(
              children: [
                const Text("data"),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
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
                    const AutoSizeText(
                      "Description :\n\n1. This nutrition screening form uses weight and height data to calculate the mass index. body (BMI) and data from patient history taking By specifying only 'yes' or 'no' answers.\n\n2. This screening form does not save or store information that You fill out and screening results if you want. Screening results, please download or print after each screening.",
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
                        text: 'Start screening',
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
