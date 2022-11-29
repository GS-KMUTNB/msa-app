// import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/screens/screens.dart';
// import 'package:intl/intl.dart';

import '../models/models.dart';
import '../shared/shared.dart';
import '../theme/theme.dart';
// import '../theme/theme.dart';

// ignore: must_be_immutable
class ResultScreen extends StatelessWidget {
  final Screening data;
  late HtmlSNSForm snsForm;
  bool isHightRisk = false;

  ResultScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  var formQuestion = [
    translate("assesment_page.description_bmi_range"),
    translate("assesment_page.description_assesment_weight_loss"),
    translate("assesment_page.description_assesment_Patients_were_fed_less"),
    translate("assesment_page.description_patients_with_critical"),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var countData = data.formData!
        .where(
          (c) => c == translate("assesment_page.table_head_yes"),
        )
        .length;
    if (countData >= 2) {
      isHightRisk = true;
    }

    var snsForm = HtmlSNSForm(
      data.date,
      data.weight,
      data.height,
      data.bmi,
      data.formData!,
      isHightRisk
          ? '${translate("results_page.answered_yes")} $countData ${translate("results_page.questions")}'
          : '${translate("results_page.answered_yes")} $countData ${translate("results_page.questions")}',
      isHightRisk
          ? translate("results_page.continue_the_nutritional")
          : translate("results_page.should_be_repeated"),
    );

    return MsaScaffold(
      appbar: MsaAppBar(
        ctx: context,
        title: translate("results_page.result"),
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
                              header: '${translate("results_page.date")} : ',
                              data: data.date,
                              unit: ""),
                          TextRowResult(
                              header: '${translate("results_page.weight")} : ',
                              data: data.weight,
                              unit: translate("results_page.kg")),
                          TextRowResult(
                              header: '${translate("results_page.height")} : ',
                              data: data.height,
                              unit: translate("results_page.cm")),
                          TextRowResult(
                              header:
                                  '${translate("assesment_page.text_box_bmi")} : ',
                              data: data.bmi,
                              unit: translate("results_page.kg/m")),
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
                            TextSpan(
                              text: translate("results_page.result_is"),
                              style: const TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: isHightRisk
                                  ? '\n - ${translate("results_page.answered_yes")} $countData ${translate("results_page.questions")}.\n - ${translate("results_page.continue_the_nutritional")}'
                                  : '\n - ${translate("results_page.answered_yes")} $countData ${translate("results_page.questions")}.\n - ${translate("results_page.should_be_repeated")}',
                              style: const TextStyle(color: blackColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: primaryColor,
                            height: 50,
                            width: width,
                            child: PrintPdf(
                              sns: snsForm,
                              type: 'sns',
                            ),
                          ),
                          msaSizeBox(),
                          isHightRisk
                              ? Container(
                                  color: primaryColor4,
                                  height: 50,
                                  width: width,
                                  child: TextButton(
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              GanttChartScreen(
                                            buildContext: context,
                                          ),
                                        ),
                                      ),
                                    },
                                    child: Text(
                                      translate("results_page.next_button"),
                                      style: const TextStyle(color: blackColor),
                                    ),
                                  ),
                                )
                              : const SizedBox()
                        ],
                      ),
                    ),
                    msaSizeBox(height: 50)
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
