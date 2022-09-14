import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  CalcDisplay({
    Key? key,
  }) : super(key: key);

  final TextEditingController _calculationsController =
      TextEditingController(text: "Hello");
  final TextEditingController _resultController =
      TextEditingController(text: "= 0");

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Color(0xFF23242D),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              controller: _calculationsController,
              enabled: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.grey[300],
              ),
            ),
            TextField(
              controller: _resultController,
              enabled: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}