import 'package:flutter/material.dart';

enum Position { Left, Right }

enum ButtonType { Primary, Secondary, Disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Position iconPosition;
  final ButtonType buttonType;
  const CustomButton(
      {super.key,
      required this.label,
      required this.icon,
      this.iconPosition = Position.Left,
      this.buttonType = ButtonType.Primary});

  Color getButtonColor(ButtonType buttonType) {
    switch (buttonType) {
      case ButtonType.Primary:
        return Colors.blue;
      case ButtonType.Secondary:
        return Colors.green;
      case ButtonType.Disabled:
        return const Color.fromARGB(255, 210, 210, 210);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: getButtonColor(buttonType),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: iconPosition == Position.Left
                ? [
                    Icon(icon, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(
                      label,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                    ),
                  ]
                : [
                    Text(
                      label,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(icon, color: Colors.grey[600]),
                  ]));
  }
}

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(title: const Text('Custom buttons')),
    body: const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomButton(
          label: 'Submit',
          icon: Icons.check,
          iconPosition: Position.Left,
          buttonType: ButtonType.Primary,
        ),
        CustomButton(
          label: 'Time',
          icon: Icons.access_time,
          iconPosition: Position.Right,
          buttonType: ButtonType.Secondary,
        ),
        CustomButton(
          label: 'Disabled',
          icon: Icons.disabled_by_default,
          iconPosition: Position.Left,
          buttonType: ButtonType.Disabled,
        ),
      ],
    ),
  )));
}
