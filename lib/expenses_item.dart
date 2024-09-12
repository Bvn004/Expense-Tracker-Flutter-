import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/variblesreq.dart';
import 'package:flutter/material.dart';

class Expenseitem extends StatelessWidget {
  Expenseitem({
    required this.expense,
    super.key,
  });

  final expensevar expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('₹ ${expense.amount.toStringAsFixed(3)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categicons[expense.category]),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(expense.daterrr),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
