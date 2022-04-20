import 'dart:math';
import 'package:flutter/material.dart';

class Calculator_brain {
  Calculator_brain(this.weight, this.height);
  final dynamic weight;
  final dynamic height;
  late dynamic _bmi;
  String calculate_bmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getresult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "normal";
    } else {
      return "underweight";
    }
  }

  String comment() {
    if (_bmi >= 25) {
      return "YOUR BODY WEIGHT IS HIGHER THAN NORMAL";
    } else if (_bmi >= 18.5) {
      return "YOUR BODY WEIGHT IS NORMAL \n GREAT JOB!!";
    } else {
      return "YOUR BODY WEIGHT IS LOWER THAN NORMAL";
    }
  }
}
