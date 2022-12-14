import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/screens/screens.dart';
import 'package:msa_app/shared/shared.dart';
import 'package:msa_app/theme/theme.dart';

class GanttChartDialysisTodoScreen extends StatefulWidget {
  const GanttChartDialysisTodoScreen(
      {Key? key, required BuildContext buildContext})
      : super(key: key);

  @override
  State<GanttChartDialysisTodoScreen> createState() =>
      _GanttChartDialysisTodoState();
}

class _GanttChartDialysisTodoState extends State<GanttChartDialysisTodoScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MsaAppBar(
        ctx: context,
        haveTutor: true,
        title: translate("gantt_chart.title"),
        maxLines: 2,
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
            haveButton: true,
            have2Button: true,
            haveColorText: true,
            haveQuestions: false,
            title: translate("warning_page_start.warning"),
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
          builder: (BuildContext context) => MsaHintAlert(
            context: context,
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
        child: Form(
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
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        MsaButton(
                          w: width,
                          h: 40,
                          text: translate("assesment_page.result"),
                          textStyle: const TextStyle(color: blackColor),
                          color: primaryColor5,
                          onPressed: () {},
                        ),
                        msaSizeBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          width: width,
                          height: height / 1.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: bgGreyColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              msaSizeBox(),
                              SizedBox(
                                width: width / 6,
                                height: width / 6,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const GanttChartDialysisAddScreen()));
                                  },
                                  backgroundColor: primaryColor,
                                  child: const Icon(Icons.add),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
