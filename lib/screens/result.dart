// import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../models/models.dart';
import '../shared/globals/alert_hint.dart';
import '../shared/shared.dart';
import '../theme/theme.dart';
// import '../theme/theme.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  final Screening data;

  ResultScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  var formQuestion = [
    "The patient had an unintentional weight loss in During the past 6 months?",
    "Patients were fed less than they used to (> 7 days).",
    "BMI < 18.5 or > = 25.0 kg/m2?",
    "Patients with critical illness or semi-crisis .or not"
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var countData = data.formData!.where((c) => c == "Yes").length;

    // print(data.formData);

    return MsaScaffold(
      appbar: MsaAppBar(
        ctx: context,
        title: "Result screening nutritional status",
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
              Navigator.popUntil(context, ModalRoute.withName(
                  // ignore: fixme
                  Navigator.defaultRouteName)); //FIXME
            },
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
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextRowResult(
                              header: 'Date : ', data: data.date, unit: ""),
                          TextRowResult(
                              header: 'Weight : ',
                              data: data.weight,
                              unit: "kg"),
                          TextRowResult(
                              header: 'Height : ',
                              data: data.height,
                              unit: "cm"),
                          TextRowResult(
                              header: 'BMI : ',
                              data: data.bmi,
                              unit: "kg./m^2"),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: formQuestion.length,
                      itemBuilder: (context, index) {
                        return FormListResult(
                          answer: data.formData![index],
                          qustion: formQuestion[index],
                          index: (index + 1),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Your screening result is',
                              style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '\n- You answered yes to $countData questions\n- Continue the nutritional assessment. or consult a dietitian/nutrition team',
                              style: const TextStyle(color: blackColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(8),
                    //   child: Column(
                    //     children: [
                    //       ElevatedButton(
                    //         onPressed: () {},
                    //         child: Text("aaaaa"),
                    //         style: ElevatedButton.styleFrom(
                    //             primary: Colors.purple,
                    //             padding: EdgeInsets.symmetric(
                    //                 horizontal: 50, vertical: 20),
                    //             textStyle: TextStyle(
                    //                 fontSize: 30, fontWeight: FontWeight.bold)),
                    //       ),
                    //       ElevatedButton(
                    //         onPressed: () {},
                    //         child: Text("bbbb"),
                    //         style: ElevatedButton.styleFrom(
                    //             primary: Colors.purple,
                    //             padding: EdgeInsets.symmetric(
                    //                 horizontal: 50, vertical: 20),
                    //             textStyle: TextStyle(
                    //                 fontSize: 30, fontWeight: FontWeight.bold)),
                    //       )
                    //     ],
                    //   ),
                    // )
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
