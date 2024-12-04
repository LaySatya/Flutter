import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food; 

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    String title = _titleController.text;
    double amount = double.tryParse(_valueController.text) ?? 0.0;   // why this work instead of using parse()

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      _showIncompleteFormAlert();
      return;
    }

    // Create the expense
    Expense expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory,
    );

    // Pass the expense back to parent widget
    widget.onCreated(expense);

    Navigator.pop(context);
  }

  // date picker
  void _presentDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }


  // alert user for in completed input
  void _showIncompleteFormAlert() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Incomplete Form'),
        content: const Text('Please fill all the required fields!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close the dialog
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                ),
              ),
              TextButton(
                onPressed: _presentDatePicker,
                child: const Text(
                  'Choose Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButton<Category>(
            value: _selectedCategory,
            items: Category.values.map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.toString().split('.').last),
              );
            }).toList(),
            onChanged: (Category? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedCategory = newValue;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: onAdd, child: const Text('Create')),
            ],
          ),
        ],
      ),
    );
  }
}
