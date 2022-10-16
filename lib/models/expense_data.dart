class ExpenseData {
  ExpenseData({
    required this.id,
    required this.expenseCategory,
    required this.pod1,
    required this.pod2,
    this.pod3,
    this.pod4,
  });
  final int id;
  final String expenseCategory;
  final num pod1;
  final num pod2;
  final num? pod3;
  final num? pod4;
}

// class ResultData {
//   ResultData({})

//  final int id;
//   final String expenseCategory;
//   final num pod1;
//   final num pod2;
//   final num? pod3;
//   final num? pod4;


// }
