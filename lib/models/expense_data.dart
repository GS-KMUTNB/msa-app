import 'package:flutter/material.dart';

class ExpenseData {
  ExpenseData({
    required this.expenseCategory,
    required this.pod1,
    required this.pod2,
    this.pod3,
    this.pod4,
    required this.color1,
    required this.color2,
    this.color3,
    this.color4,
  });
  final String expenseCategory;
  final num pod1;
  final num pod2;
  final num? pod3;
  final num? pod4;

  final Color? color1;
  final Color? color2;
  final Color? color3;
  final Color? color4;
}
