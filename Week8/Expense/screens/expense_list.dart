import 'package:flutter/material.dart';
import 'package:flutter_course/Course/Week8/Expense/models/expense.dart';
import 'package:intl/intl.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  getIcon(ExpenseType category) {
    switch (category) {
      case ExpenseType.food:
        return Icons.food_bank;
      case ExpenseType.leisure:
        return Icons.cast_for_education_outlined;
      case ExpenseType.travel:
        return Icons.travel_explore;
      case ExpenseType.work:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return Container(
          margin: const EdgeInsets.only(left:10, right:10, top: 10),
          // padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 0.1),
            borderRadius: BorderRadius.circular(15),
            // put shadow 
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(2.0, 2.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expense.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${expense.amount.toStringAsFixed(2)}', 
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      getIcon(expense.type),
                      size: 25,
                      color: Colors.grey[700],
                    ),
                    const SizedBox(width: 10),
                    Text(
                      DateFormat.yMd().format(expense.date),  
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
