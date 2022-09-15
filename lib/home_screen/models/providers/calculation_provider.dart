import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculationProvider extends ChangeNotifier {
  String _calculation = "";
  String _equation = "";
  String _result = "= 0";

  late double number1;
  late double number2;
  late double answer;

  int lengthOfTheCurrentNumber = 0;
  // 0 - Initial Value
  // 1 - Addition
  // 2 - Subtraction
  // 3 - Multiplication
  // 4 - Division
  int operation = 0;

  bool isLastElementOperator = false;
  bool fillNumber2 = false;

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

    /* lengthOfTheCurrentNumber++;

    _result =
        "= ${calculation.substring(calculation.length - lengthOfTheCurrentNumber, calculation.length)}";

    number1 = double.parse(result.substring(2));

    if (isLastElementOperator) {
      fillNumber2 = true;
    }

    if (fillNumber2) {
      number2 = double.parse(calculation.substring(
          calculation.length - lengthOfTheCurrentNumber, calculation.length));
    }

    print("Result: $result");
    print("Num1: $number1");
    print("Num2: $number2");

    if (operation == 1) {
      add();
    } else if (operation == 2) {
      subtract();
    } else if (operation == 3) {
      multiplication();
    } else if (operation == 4) {
      division();
    }

    isLastElementOperator = false; */

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

    if (operator == "+") {
      operation = 1;
    } else if (operator == "-") {
      operation = 2;
    } else if (operator == "×") {
      operation = 3;
    } else if (operator == "÷") {
      operation = 4;
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
        print(calculation);
      }

      if (equation != "") {
        _equation = equation.substring(0, equation.length - 1);
        print(equation);
      }

      if (equation.endsWith("+") ||
          equation.endsWith("-") ||
          equation.endsWith("*") ||
          equation.endsWith("/")) {
        isEquationEndsWithOperator = true;
      } else {
        isEquationEndsWithOperator = false;
      }

      print(calculation.length);
      print(equation.length);

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
        print(result);
      }

      lengthOfTheCurrentNumber--;

      notifyListeners();
    }
  }

  void clearAll() {
    _calculation = "";

    _equation = "";

    setResult = "0";

    operation = 0;

    lengthOfTheCurrentNumber = 0;

    // number1 = 0;
    // number2 = 0;

    notifyListeners();
  }

  /* void add() {
    answer = number1 + number2;
    number1 = answer;

    setResult = answer.toString();
  }

  void subtract() {
    answer = number1 - number2;
    number1 = answer;

    setResult = answer.toString();
  }

  void multiplication() {
    answer = number1 * number2;
    number1 = answer;

    setResult = answer.toString();
  }

  void division() {
    answer = number1 / number2;
    number1 = answer;

    setResult = answer.toString();
  } */

  void percentage() {
    answer = double.parse(equation) / 100.0;

    clearAll();

    setCalculationNumber = answer.toString();

    setResult = answer.toString();
  }
}
