import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.textColor,
    required this.borderRadius,
    required this.bgColor,
    required this.actions,
    required this.buttonText,
    required this.padding,
    required this.margin,
    this.buttonWidth,
    required this.haveBorder,
  });
  final Color textColor;
  final double borderRadius;
  final Color? bgColor;
  final String buttonText;
  // final Widget nextPage;
  final VoidCallback actions;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double? buttonWidth;
  final bool haveBorder;

  @override
  Widget build(BuildContext context) {
    final double defaultButtonWidth = buttonWidth ?? MediaQuery.of(context).size.width;
    return SizedBox(
      width: defaultButtonWidth,
      child: ElevatedButton(
        onPressed: actions,
        style: ElevatedButton.styleFrom( 
          backgroundColor: bgColor, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: haveBorder ? BorderSide(
              color: textColor,
              width: 1,
            ) : 
            BorderSide.none,
          ), 
          padding: padding,  
        ), 
        child: Text(
          buttonText, 
          style: TextStyle(
            color: textColor, 
            fontSize: 20,
          ),
        )
      ),
    );
  }
}