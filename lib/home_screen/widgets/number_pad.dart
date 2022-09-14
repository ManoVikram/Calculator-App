import 'package:flutter/material.dart';
import 'package:nawgati_calculator_app/home_screen/models/providers/calculation_provider.dart';
import 'package:provider/provider.dart';

import './calc_button.dart';

class NumberPad extends StatelessWidget {
  const NumberPad({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalculationProvider calculationProvider =
        context.watch<CalculationProvider>();

    return Expanded(
      flex: 6,
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
                  onTap: () {
                    calculationProvider.clearAll();
                  },
                ),
                CalcButton(
                  text: "⌫",
                  textColor: Colors.tealAccent,
                  onTap: () {
                    calculationProvider.delete();
                  },
                ),
                CalcButton(
                  text: "%",
                  textColor: Colors.tealAccent,
                  onTap: () {
                    calculationProvider.percentage();
                  },
                ),
                CalcButton(
                  text: "÷",
                  textColor: Colors.redAccent,
                  onTap: () {
                    calculationProvider.setCalculationOperator = "÷";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "7",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "7";
                  },
                ),
                CalcButton(
                  text: "8",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "8";
                  },
                ),
                CalcButton(
                  text: "9",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "9";
                  },
                ),
                CalcButton(
                  text: "×",
                  textColor: Colors.redAccent,
                  onTap: () {
                    calculationProvider.setCalculationOperator = "×";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "4",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "4";
                  },
                ),
                CalcButton(
                  text: "5",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "5";
                  },
                ),
                CalcButton(
                  text: "6",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "6";
                  },
                ),
                CalcButton(
                  text: "-",
                  textColor: Colors.redAccent,
                  onTap: () {
                    calculationProvider.setCalculationOperator = "-";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "1",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "1";
                  },
                ),
                CalcButton(
                  text: "2",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "2";
                  },
                ),
                CalcButton(
                  text: "3",
                  onTap: () {
                    calculationProvider.setCalculationNumber = "3";
                  },
                ),
                CalcButton(
                  text: "+",
                  textColor: Colors.redAccent,
                  onTap: () {
                    calculationProvider.setCalculationOperator = "+";
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton(
                  text: "0",
                  isLong: true,
                  onTap: () {
                    calculationProvider.setCalculationNumber = "0";
                  },
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
