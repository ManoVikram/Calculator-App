import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculationProvider extends ChangeNotifier {
  String _calculation = "";
  String _result = "= 0";

  late double number1;
  late double number2;
  late double answer;

  String get calculation => _calculation;

  String get result => _result;

  set setCalculationNumber(String calc) {
    if ((calculation == "" && calc == '0') || calculation.length == 15) return;

    _calculation += calc;

    _result = "= $calculation";

    number1 = double.parse(_result.substring(2));

    // _calculation = NumberFormat("###,###,###,###,###").format(int.parse(calculation));

    notifyListeners();
  }

  set setCalculationOperator(String operator) {
    if (calculation == "") {
      _calculation = "0 $operator";
    } else if (calculation.endsWith("+") ||
        calculation.endsWith("-") ||
        calculation.endsWith("×") ||
        calculation.endsWith("÷")) {
      _calculation = calculation.substring(0, calculation.length - 1);
      _calculation += operator;
    } else {
      number1 = double.parse(calculation);

      _calculation += "\n$operator";
    }

    notifyListeners();
  }

  set setResult(String res) {
    _result = "= $res";

    notifyListeners();
  }

  void delete() {
    if (calculation.isNotEmpty) {
      _calculation = calculation.substring(0, calculation.length - 1);

      if (calculation.isEmpty) {
        _result = "= 0";
      } else {
        _result = "= $calculation";
      }

      notifyListeners();
    }
  }

  void clearAll() {
    _calculation = "";

    setResult = "0";

    notifyListeners();
  }

  void add() {
    answer = number1 + number2;

    setResult = answer.toString();
  }

  void subtract() {
    answer = number1 - number2;

    setResult = answer.toString();
  }

  void nultiply() {
    answer = number1 * number2;

    setResult = answer.toString();
  }

  void divide() {
    answer = number1 / number2;

    setResult = answer.toString();
  }

  void percentage() {
    answer = number1 / 100;
    
    clearAll();
    setCalculationNumber = answer.toString();

    setResult = answer.toString();
  }
}
