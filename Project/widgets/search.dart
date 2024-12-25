import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
   final Function(String) onSearch;
   const SearchTextField(
    {
      Key? key,
      required this.onSearch,
    }
   );
  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
          
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
          
        ),
        
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
      ),
       onChanged: (value) {
        widget.onSearch(value); 
      },
      onSubmitted: (value) {
        widget.onSearch(value); 
      },

    );
  }
}


