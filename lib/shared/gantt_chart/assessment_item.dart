import 'package:flutter/material.dart';
import 'package:msa_app/models/models.dart';
import 'package:msa_app/theme/theme.dart';

class AssessMentItem extends StatelessWidget {
  AssessMentItem({
    required this.data,
    // required this.onTodoChanged,
  }) : super(key: ObjectKey(data));

  final ExpenseData data;
  // final onTodoChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor4,
      child: ListTile(
        title: Text("Round ${data.id} ${data.expenseCategory}"),
        subtitle: const Text("test lorem"),
        trailing: const Icon(Icons.edit),
        onTap: () {},
      ),
    );
  }
}
