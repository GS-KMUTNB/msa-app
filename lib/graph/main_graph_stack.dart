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
          StackedColumnSeries<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.pod1,
              pointColorMapper: (ExpenseData exp, _) => exp.color1,
              name: "EN Energy"),
          StackedColumnSeries<ExpenseData, String>(
              dataSource: _chartData,
              xValueMapper: (ExpenseData exp, _) => exp.expenseCategory,
              yValueMapper: (ExpenseData exp, _) => exp.pod2,
              pointColorMapper: (ExpenseData exp, _) => exp.color2,
              name: "PN Energy"),
        ],
        tooltipBehavior: _tooltipBehavior,
        primaryXAxis: CategoryAxis(),
      ),
    ));
  }

  List<ExpenseData> getChaetData() {
    final List<ExpenseData> chartData = [
      ExpenseData("POD-1", 1200, 520, Colors.indigo[300], Colors.yellow[600]),
      ExpenseData("POD-1ER", 1000, 0, Colors.grey, Colors.grey[50]),
      ExpenseData("POD-2", 1200, 520, Colors.indigo[300], Colors.yellow[600]),
      ExpenseData("POD-2ER", 1000, 0, Colors.grey, Colors.grey[50]),
      ExpenseData("POD-3", 1200, 520, Colors.indigo[300], Colors.yellow[600]),
      ExpenseData("POD-3ER", 1000, 0, Colors.grey, Colors.grey[50]),
      ExpenseData("POD-4", 1200, 520, Colors.indigo[300], Colors.yellow[600]),
      ExpenseData("POD-4ER", 1000, 0, Colors.grey, Colors.grey[50]),
      ExpenseData("POD-5", 1200, 520, Colors.indigo[300], Colors.yellow[600]),
      ExpenseData("POD-5ER", 1000, 0, Colors.grey, Colors.grey[50]),
      ExpenseData("POD-6", 1200, 520, Colors.indigo[300], Colors.yellow[600]),
      ExpenseData("POD-6ER", 1000, 0, Colors.grey, Colors.grey[50]),
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
