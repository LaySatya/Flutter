import 'package:flutter/material.dart';

class ButtonSelection extends StatefulWidget {
  const ButtonSelection({super.key});

  @override
  State<ButtonSelection> createState() => _ButtonSelectionState();
}

class _ButtonSelectionState extends State<ButtonSelection> {
  bool isSelected = false;

  String getTextLabel() => isSelected ? "Selected" : "Not selected";
  Color? getTextColor() => isSelected ? Colors.white : Colors.black;
  Color? getBackgroundColor() => isSelected ? Colors.blue[500] : Colors.blue[50];

  void toggleButtonSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: getBackgroundColor(),
          padding: const EdgeInsets.all(40),
        ),
        onPressed: toggleButtonSelection,
        child: Center(
          child: Text(
            getTextLabel(),
            style: TextStyle(
              color: getTextColor(),
              fontSize: 20,
            ),
          ),
        ));
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonSelection(),
                SizedBox(height: 10),
                ButtonSelection(),
                SizedBox(height: 10),
                ButtonSelection(),
                SizedBox(height: 10),
                ButtonSelection(),
              ],
            ),
          )
        ),
      ),
    ));
