import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var colorskeme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: colorskeme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorskeme.onPrimaryContainer,
          foregroundColor: colorskeme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: colorskeme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorskeme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: colorskeme.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      home: Expenses(),
    ),
  );
}
