import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';

var kcolscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 166, 255));

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
      colorScheme: kcolscheme,
      appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kcolscheme.onPrimaryContainer,
          foregroundColor: kcolscheme.primaryContainer),
      cardTheme: CardTheme().copyWith(
        color: kcolscheme.secondaryContainer,
        margin: EdgeInsets.all(15),
      ),
      textTheme:
          TextTheme().copyWith(titleLarge: TextStyle(color: Colors.white)),
    ),
    debugShowCheckedModeBanner: false,
    home: Expenses(),
  ));
}
