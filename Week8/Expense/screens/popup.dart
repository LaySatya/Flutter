import 'package:flutter/material.dart';

import '../models/expense.dart';
import './date_picker.dart';

// put the ExpenseType from the file ../models/expense.dart in a list
const List<ExpenseType> expenseTypes = ExpenseType.values;

class Modal extends StatefulWidget {
  const Modal({super.key,});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _datePickerController = TextEditingController();
  ExpenseType? _selectedType;
  void onPressed() {
    String title = _titleController.text;
    double amount = double.parse(_amountController.text);
    String date = _datePickerController.text;
    String type = _selectedType != null ? _selectedType!.name : 'None';
    print("Title= $title");
    print("Amount= $amount");
    print("Date= $date");
    print("Type= $type");
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _datePickerController.dispose();
    super.dispose();
  }

  void chooseType(ExpenseType? value) {
    setState(() {
      _selectedType = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          iconColor: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 0,
          padding: EdgeInsets.zero,
        ),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 6,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Add New Expense',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        hintText: 'Enter the title of the expense',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Amount',
                              hintText: 'Enter the amount',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.grey.shade300),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: DatePicker(controller: _datePickerController),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<ExpenseType>(
                      value: _selectedType,
                      onChanged: chooseType,
                      decoration: InputDecoration(
                        labelText: 'Expense Type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      items: expenseTypes.map((ExpenseType type) {
                        return DropdownMenuItem<ExpenseType>(
                          value: type,
                          child: Text(type.name),
                        );
                      }).toList(),
                      hint: const Text('Select type'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        iconColor: Colors.blue, // Button color
                        padding: const EdgeInsets.all(15),
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Add Expense'),
                    ),
                    
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
