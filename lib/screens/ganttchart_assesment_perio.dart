import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/models/models.dart';
import 'package:msa_app/screens/screens.dart';
import 'package:msa_app/shared/shared.dart';
import 'package:msa_app/theme/theme.dart';

class GanttChartTodoScreen extends StatefulWidget {
  const GanttChartTodoScreen(
      {Key? key, required this.dataList, required this.context})
      : super(key: key);

  final List<ExpenseData> dataList;
  final BuildContext context;

  @override
  State<GanttChartTodoScreen> createState() => _GanttChartTodoState();
}

class _GanttChartTodoState extends State<GanttChartTodoScreen> {
  List<ExpenseData> dataList = <ExpenseData>[];

  @override
  void initState() {
    // TODO: implement initState

    dataList = widget.dataList;

    super.initState();
  }

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
            ifPicture: false,
            haveButton: true,
            have2Button: true,
            haveColorText: true,
            haveQuestions: false,
            title: "Warning !!!",
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
              child: Center(
                child: CardContent(
                  w: width - 40,
                  h: height / 1.20,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: MsaButton(
                          color: dataList.isEmpty ? bgGreyColor : primaryColor5,
                          h: 40,
                          w: width - 75,
                          text: translate("assesment_page.result"),
                          textStyle: bodyText1,
                          onPressed: () {
                            dataList.isEmpty
                                ? null
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MsaGanttChartResultScreen(
                                        title: 'Perioperative Patient',
                                        // data: null,
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          children: widget.dataList.map((ExpenseData data) {
                            return AssessMentItem(
                              data: data,
                              // onTodoChanged: () {
                              //   print("test");
                              // },
                            );
                          }).toList(),
                        ),
                      ),
                      msaSizeBox(height: 10),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GanttChartAddScreen(
                    data: dataList,
                  ),
                ),
              );
            },
            backgroundColor: primaryColor,
            child: const Icon(Icons.add),
          ),
          msaSizeBox(height: 20)
        ],
      ),
    );
  }
}
