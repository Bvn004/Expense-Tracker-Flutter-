import 'package:expense_tracker/expenses_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/variblesreq.dart';

class Expenseslist extends StatelessWidget {
  const Expenseslist({
    super.key,
    required this.expenses,
    required this.onremoved,
  });

  final void Function(expensevar expenses) onremoved;
  final List<expensevar> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (direction) {
                onremoved(expenses[index]);
              },
              key: ValueKey(expenses[index]),
              child: Expenseitem(expense: expenses[index]),
            ));
  }
}
