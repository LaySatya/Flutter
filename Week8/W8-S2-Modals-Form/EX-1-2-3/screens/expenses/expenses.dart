import 'package:flutter/material.dart';

import '../../models/expense.dart';
import 'expenses_form.dart';
import 'expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  Expense? _recentlyRemovedExpense;
  int? _recentlyRemovedIndex;

  void onExpenseRemoved(Expense expense) {
    final index = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.removeAt(index);
    });

    // Save the removed expense and its index for undo
    _recentlyRemovedExpense = expense;
    _recentlyRemovedIndex = index;

    // Show Snackbar with Undo option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Reinsert the current removed expense
            setState(() {
              if (_recentlyRemovedExpense != null &&
                  _recentlyRemovedIndex != null) {
                _registeredExpenses.insert(_recentlyRemovedIndex!, _recentlyRemovedExpense!);
              }
            });
            // Reset data or index
            _recentlyRemovedExpense = null;
            _recentlyRemovedIndex = null;
          },
        ),
      ),
    );
  }

  void onExpenseCreated(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => ExpenseForm(
        onCreated: onExpenseCreated,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddPressed,
          )
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: _registeredExpenses.isEmpty
          ? const Center(
              child: Text(
                'No expenses found. Start adding some!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ExpensesList(
              expenses: _registeredExpenses,
              onExpenseRemoved: onExpenseRemoved,
            ),
    );
  }
}
