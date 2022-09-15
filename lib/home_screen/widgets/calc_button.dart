import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  const CalcButton({
    Key? key,
    required this.text,
    this.textColor = Colors.white,
    this.isLong = false,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final bool isLong;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 74.0,
        width: isLong ? 164.0 : 74.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF23242D),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}