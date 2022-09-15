import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculationProvider extends ChangeNotifier {
  String _calculation = "";
  String _equation = "";
  String _result = "= 0";

  late double answer;

  int lengthOfTheCurrentNumber = 0;

  bool isLastElementOperator = false;

  String get calculation => _calculation;

  String get equation => _equation;

  String get result => _result;

  set setCalculationNumber(String calc) {
    if ((calculation == "" && calc == '0') || lengthOfTheCurrentNumber >= 15) {
      return;
    }

    _calculation += calc;
    _equation += calc;

    Parser parser = Parser();
    Expression expression = parser.parse(equation);
    _result =
        "= ${expression.evaluate(EvaluationType.REAL, ContextModel()).toString()}";

    notifyListeners();
  }

  set setCalculationOperator(String operator) {
    if (calculation == "") {
      _calculation = "0$operator";
    } else if (calculation.endsWith("+") ||
        calculation.endsWith("-") ||
        calculation.endsWith("×") ||
        calculation.endsWith("÷")) {
      _calculation = calculation.substring(0, calculation.length - 1);
      _calculation += operator;
    } else {
      _calculation += "\n$operator";
    }

    if (operator == "÷") {
      _equation += "/";
    } else if (operator == "×") {
      _equation += "*";
    } else {
      _equation += operator;
    }

    isLastElementOperator = true;

    lengthOfTheCurrentNumber = 0;

    notifyListeners();
  }

  set setResult(String res) {
    _result = "= $res";

    notifyListeners();
  }

  void delete() {
    if (calculation.isNotEmpty) {
      bool isEquationEndsWithOperator = false;

      if (calculation != "") {
        if (calculation.endsWith("+") ||
            calculation.endsWith("-") ||
            calculation.endsWith("×") ||
            calculation.endsWith("÷")) {
          _calculation = calculation.substring(0, calculation.length - 2);
        } else {
          _calculation = calculation.substring(0, calculation.length - 1);
        }
      }

      if (equation != "") {
        _equation = equation.substring(0, equation.length - 1);
      }

      if (equation.endsWith("+") ||
          equation.endsWith("-") ||
          equation.endsWith("*") ||
          equation.endsWith("/")) {
        isEquationEndsWithOperator = true;
      } else {
        isEquationEndsWithOperator = false;
      }

      if (calculation.isEmpty) {
        _result = "= 0";
      } else {
        Parser parser = Parser();
        // Expression expression = parser.parse(equation);
        Expression expression = parser.parse(isEquationEndsWithOperator
            ? equation.substring(0, equation.length - 1)
            : equation);
        _result =
            "= ${expression.evaluate(EvaluationType.REAL, ContextModel()).toString()}";
      }

      lengthOfTheCurrentNumber--;

      notifyListeners();
    }
  }

  void clearAll() {
    _calculation = "";

    _equation = "";

    setResult = "0";

    lengthOfTheCurrentNumber = 0;

    notifyListeners();
  }

  void percentage() {
    answer = double.parse(equation) / 100.0;

    clearAll();

    setCalculationNumber = answer.toString();

    setResult = answer.toString();
  }
}
