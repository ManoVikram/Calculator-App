import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/providers/calculation_provider.dart';

class CalcDisplay extends StatelessWidget {
  CalcDisplay({
    Key? key,
  }) : super(key: key);

  // final TextEditingController _calculationsController =
  //     TextEditingController(text: "Hello");
  // final TextEditingController _resultController =
  //     TextEditingController(text: "= 0");

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Expanded(
      flex: 4,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Color(0xFF23242D),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Consumer<CalculationProvider>(
                    builder: (context, calculationProvider, child) {
                  // _calculationsController.text = calculationProvider.calculation;

                  /* return TextField(
                    controller: _calculationsController,
                    enabled: false,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.grey[300],
                    ),
                  ); */
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Text(
                      calculationProvider.calculation,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.grey[300],
                      ),
                    ),
                  );
                }),
              ),
            ),
            /* TextField(
              controller: _resultController,
              enabled: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                height: 0.7,
                fontSize: 48.0,
                fontWeight: FontWeight.w500,
              ),
            ), */
            Expanded(
              flex: 2,
              child: Consumer<CalculationProvider>(
                builder: (context, calculationProvider, child) {
                  return Text(
                    calculationProvider.result,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48.0,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
