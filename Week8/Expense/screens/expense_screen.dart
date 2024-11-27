import 'package:flutter/material.dart';
import 'expense_list.dart';
import '../models/expense.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: "book",
        type: ExpenseType.leisure,
        amount: 12,
        date: DateTime.now()),
    Expense(
        title: "milk",
        type: ExpenseType.food,
        amount: 1.5,
        date: DateTime.now()),
    Expense(
        title: "lock lack",
        type: ExpenseType.food,
        amount: 2,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ExpensesList(expenses: _registeredExpenses)
    );
}
}