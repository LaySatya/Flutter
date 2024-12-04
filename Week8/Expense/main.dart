import 'package:flutter/material.dart';
import 'screens/expense_screen.dart';
import 'screens/popup.dart';

void main() {
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Expense App',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: const [
              Modal()
            ],
          ),
          body: const ExpenseScreen()
      ),
    ),
  );
}
