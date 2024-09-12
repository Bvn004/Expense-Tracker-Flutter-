//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateform = DateFormat.yMd();

final uuid = Uuid();

enum Category { leisure, food, travel, work }

const categicons = {
  Category.leisure: Icons.movie,
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work
};

class expensevar {
  expensevar({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
  }) : id = uuid.v4();
  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Category category;

  String get daterrr {
    return dateform.format(date);
  }
}

class expensebucket {
  const expensebucket({required this.category, required this.expenses});

  final Category category;
  final List<expensevar> expenses;

  expensebucket.forCategory(List<expensevar> allexpenses,this.category): expenses=allexpenses.where((expense) => expense.category==category).toList();
  double get totalexpenses {
    double sum = 0;
    for (final i in expenses) {
      sum += i.amount;
    }
    return sum;
  }
}
