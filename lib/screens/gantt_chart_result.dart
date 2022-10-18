import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:msa_app/models/models.dart';
import 'package:msa_app/shared/shared.dart';
import 'package:msa_app/theme/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MsaGanttChartResultScreen extends StatefulWidget {
  const MsaGanttChartResultScreen({
    super.key,
    required this.title,
    // required this.data,
  });
  final String title;
  // final List<ExpenseData> data;

  @override
  State<MsaGanttChartResultScreen> createState() =>
      _MsaGanttChartResultScreenState();
}

class _MsaGanttChartResultScreenState extends State<MsaGanttChartResultScreen> {
  late List<ExpenseData> firslChartData;
  late List<ExpenseData> secondChartData;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    firslChartData = getChaetData1();
    secondChartData = getChaetData2();

    _tooltipBehavior =
        TooltipBehavior(enable: true, tooltipPosition: TooltipPosition.pointer);
    super.initState();
  }

  List<ExpenseData> getChaetData1() {
    final List<ExpenseData> chartData = [
      ExpenseData(
        id: 1,
        expenseCategory: "pod",
        pod1: 0, // EN Energy
        pod2: 10, // PN Energy
        pod3: 20,
      ),
      ExpenseData(
        id: 2,
        expenseCategory: "pod 1",
        pod1: 5, // EN Energy
        pod2: 15, // PN Energy
        pod3: 20,
      ),
      ExpenseData(
        id: 3,
        expenseCategory: "pod 2",
        pod1: 7, // EN Energy
        pod2: 20, // PN Energy
        pod3: 20,
      ),
      ExpenseData(
        id: 4,
        expenseCategory: "pod 3",
        pod1: 20, // EN Energy
        pod2: 30, // PN Energy
        pod3: 20,
      ),
    ];

    // for (var data in widget.data) {
    //   chartData.add(data);
    // }
    return chartData;
  }

  List<ExpenseData> getChaetData2() {
    final List<ExpenseData> chartData = [
      ExpenseData(
        id: 1,
        expenseCategory: "pod",
        pod1: 0, // EN Energy
        pod2: 10, // PN Energy
      ),
      ExpenseData(
        id: 2,
        expenseCategory: "pod 1",
        pod1: 5, // EN Energy
        pod2: 15, // PN Energy
      ),
      ExpenseData(
        id: 3,
        expenseCategory: "pod 2",
        pod1: 7, // EN Energy
        pod2: 20, // PN Energy
      ),
      ExpenseData(
        id: 4,
        expenseCategory: "pod 3",
        pod1: 20, // EN Energy
        pod2: 30, // PN Energy
      ),
    ];
    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MsaAppBar(
        ctx: context,
        haveTutor: true,
        title: "GANTT CHART Analytics",
        maxLines: 1,
        onPressed: () {
          Navigator.of(context).pop();
        },
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
          children: [
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
                  padding: const EdgeInsets.all(15),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          widget.title,
                          minFontSize: 16,
                          maxLines: 1,
                        ),
                        SfCartesianChart(
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.top,
                            width: "100%",
                            isResponsive: false,
                            overflowMode: LegendItemOverflowMode.wrap,
                          ),
                          series: <ChartSeries>[
                            StackedColumnSeries<ExpenseData, String>(
                              name: translate("analytics.en_energy"),
                              dataSource: firslChartData,
                              xValueMapper: (ExpenseData exp, _) =>
                                  exp.expenseCategory,
                              yValueMapper: (ExpenseData exp, _) => exp.pod1,
                              pointColorMapper: (ExpenseData exp, _) =>
                                  primaryColor5,
                            ),
                            StackedColumnSeries<ExpenseData, String>(
                              name: translate("analytics.pn_energy"),
                              dataSource: firslChartData,
                              xValueMapper: (ExpenseData exp, _) =>
                                  exp.expenseCategory,
                              yValueMapper: (ExpenseData exp, _) => exp.pod2,
                              pointColorMapper: (ExpenseData exp, _) =>
                                  primaryColor,
                            ),
                            StackedColumnSeries<ExpenseData, String>(
                              name: translate("analytics.energy_requirement"),
                              dataSource: firslChartData,
                              xValueMapper: (ExpenseData exp, _) =>
                                  exp.expenseCategory,
                              yValueMapper: (ExpenseData exp, _) => exp.pod3,
                              pointColorMapper: (ExpenseData exp, _) =>
                                  bgGreyColor,
                            ),
                          ],
                          tooltipBehavior: _tooltipBehavior,
                          primaryXAxis: CategoryAxis(),
                        ),
                        SfCartesianChart(
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.top,
                            width: "100%",
                            isResponsive: false,
                            overflowMode: LegendItemOverflowMode.wrap,
                          ),
                          series: <ChartSeries>[
                            LineSeries<ExpenseData, String>(
                              dataSource: secondChartData,
                              xValueMapper: (ExpenseData exp, _) =>
                                  exp.expenseCategory,
                              yValueMapper: (ExpenseData exp, _) => exp.pod1,
                              pointColorMapper: (ExpenseData exp, _) =>
                                  primaryColor5,
                              name: translate("analytics.protein"),
                              markerSettings:
                                  const MarkerSettings(isVisible: true),
                              dataLabelSettings: const DataLabelSettings(
                                showZeroValue: false,
                                isVisible: true,
                              ),
                            ),
                            LineSeries<ExpenseData, String>(
                              dataSource: secondChartData,
                              xValueMapper: (ExpenseData exp, _) =>
                                  exp.expenseCategory,
                              yValueMapper: (ExpenseData exp, _) => exp.pod2,
                              pointColorMapper: (ExpenseData exp, _) =>
                                  primaryColor,
                              name: translate("analytics.protein_requirement"),
                              markerSettings:
                                  const MarkerSettings(isVisible: true),
                              dataLabelSettings: const DataLabelSettings(
                                showZeroValue: false,
                                isVisible: true,
                              ),
                            ),
                          ],
                          tooltipBehavior: _tooltipBehavior,
                          primaryXAxis: CategoryAxis(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
