import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<ExpenseData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChaetData();
    _tooltipBehavior =
        TooltipBehavior(enable: true, tooltipPosition: TooltipPosition.pointer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        title: ChartTitle(text: 'MAS APP'),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          LineSeries<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
            yValueMapper: (ExpenseData exp, _) => exp.pod1,
            pointColorMapper: (ExpenseData exp, _) => exp.color1,
            name: "Protein",
            markerSettings: const MarkerSettings(isVisible: true),
            dataLabelSettings: const DataLabelSettings(
              showZeroValue: false,
              isVisible: true,
            ),
          ),
          LineSeries<ExpenseData, String>(
            dataSource: _chartData,
            xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
            yValueMapper: (ExpenseData exp, _) => exp.pod2,
            pointColorMapper: (ExpenseData exp, _) => exp.color2,
            name: "Protein requirement",
            markerSettings: const MarkerSettings(isVisible: true),
            dataLabelSettings: const DataLabelSettings(
              showZeroValue: false,
              isVisible: true,
            ),
          ),
        ],
        tooltipBehavior: _tooltipBehavior,
        primaryXAxis: CategoryAxis(),
      ),
    ));
  }

  List<ExpenseData> getChaetData() {
    final List<ExpenseData> chartData = [
      ExpenseData("POD-(-1)", 57, 60, Colors.green, Colors.grey),
      ExpenseData("POD", 0, 0, Colors.green, Colors.grey),
      ExpenseData("POD-1", 0, 0, Colors.green, Colors.grey),
      ExpenseData("POD-2", 0, 0, Colors.green, Colors.grey),
      ExpenseData("POD-3", 0, 0, Colors.green, Colors.grey),
      ExpenseData("POD-4", 0, 0, Colors.green, Colors.grey),
      ExpenseData("POD-5", 0, 0, Colors.green, Colors.grey),
      ExpenseData("POD-6", 0, 0, Colors.green, Colors.grey),
    ];
    return chartData;
  }
}

class ExpenseData {
  ExpenseData(
      this.expenseCategory, this.pod1, this.pod2, this.color1, this.color2);
  final String expenseCategory;
  final num pod1;
  final num pod2;
  final Color? color1;
  final Color? color2;
}
