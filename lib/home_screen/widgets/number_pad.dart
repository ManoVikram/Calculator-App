import 'package:flutter/material.dart';

import './calc_button.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Color(0xFF2A2D37),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "AC",
                  textColor: Colors.tealAccent,
                  onTap: () {},
                ),
                CalcButton(
                  text: "+/-",
                  textColor: Colors.tealAccent,
                  onTap: () {},
                ),
                CalcButton(
                  text: "%",
                  textColor: Colors.tealAccent,
                  onTap: () {},
                ),
                CalcButton(
                  text: "÷",
                  textColor: Colors.redAccent,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "7",
                  onTap: () {},
                ),
                CalcButton(
                  text: "8",
                  onTap: () {},
                ),
                CalcButton(
                  text: "9",
                  onTap: () {},
                ),
                CalcButton(
                  text: "×",
                  textColor: Colors.redAccent,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "6",
                  onTap: () {},
                ),
                CalcButton(
                  text: "5",
                  onTap: () {},
                ),
                CalcButton(
                  text: "4",
                  onTap: () {},
                ),
                CalcButton(
                  text: "-",
                  textColor: Colors.redAccent,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "1",
                  onTap: () {},
                ),
                CalcButton(
                  text: "2",
                  onTap: () {},
                ),
                CalcButton(
                  text: "3",
                  onTap: () {},
                ),
                CalcButton(
                  text: "+",
                  textColor: Colors.redAccent,
                  onTap: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "0",
                  isLong: true,
                  onTap: () {},
                ),
                CalcButton(
                  text: ".",
                  onTap: () {},
                ),
                CalcButton(
                  text: "=",
                  textColor: Colors.redAccent,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
