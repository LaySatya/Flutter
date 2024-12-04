import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DatePicker extends StatefulWidget {
  final TextEditingController controller;
  DatePicker({required this.controller});
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(), // Default date
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;     
        widget.controller.text = DateFormat('yyyy-MM-dd').format(picked); 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _selectedDate == null
                  ? 'Please select a date'
                  : 'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
            ),
          ],
    );
  }
}
