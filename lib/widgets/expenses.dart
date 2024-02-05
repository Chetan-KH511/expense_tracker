import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpesesState();
  }
}

class _ExpesesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    Expense(
      date: DateTime.now(),
      title: 'Flutter course',
      amount: 19.99,
      category: Category.college,
    ),
    Expense(
      date: DateTime.now(),
      title: 'Cinema',
      amount: 15.69,
      category: Category.travel,
    ),
  ];

  void _addExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Newexpense(
        onAddexpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = Center(
      child: const Text('No expenses found'),
    );

    if (registeredExpenses.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: registeredExpenses,
        dismiss: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _addExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: registeredExpenses),
          Expanded(child: maincontent),
        ],
      ),
    );
  }
}
