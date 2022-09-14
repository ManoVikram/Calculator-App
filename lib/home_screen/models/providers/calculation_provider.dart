import 'package:flutter/material.dart';

class CalculationProvider extends ChangeNotifier {
  late final String _calculation;
  late final String _result;

  String get calculation => _calculation;

  String get result => _result;

  set calculation(String calc) {
    _calculation += calc;
  }
}
