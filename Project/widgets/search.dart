import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Colors.black38,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
      ),
      onChanged: (value) {
        setState(() {});
        // Add search logic here
      },
    );
  }
}


