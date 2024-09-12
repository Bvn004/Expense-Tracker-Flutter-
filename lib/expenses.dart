import 'package:expense_tracker/addexpenses.dart';
import 'package:expense_tracker/chart.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/variblesreq.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void removeexpense(expensevar expense) {
    setState(() {
      _registeredexpenses.remove(expense);
    });
  }

  final List<expensevar> _registeredexpenses = [
    expensevar(
        title: 'flutter course',
        amount: 500,
        date: DateTime.now(),
        category: Category.work),
    expensevar(
        title: 'movies',
        amount: 250,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Newexpenses(
            onaddexpense: addexpense,
          );
        });
  }

  void addexpense(expensevar expense) {
    setState(() {
      _registeredexpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 253, 251, 255),
      body: Column(
        children: [
          Chart(expenses: _registeredexpenses),
          Expanded(
              child: Expenseslist(
            expenses: _registeredexpenses,
            onremoved: removeexpense,
          )),
        ],
      ),
    );
  }
}
