import 'dart:math';

import 'package:flutter/material.dart';

class BMIResult {
  final int weight;
  final int height;
  late double result;

  BMIResult(this.weight, this.height);
  double calculateBMI() {
    result = weight / pow(height / 100, 2);
    return result;
  }

  String checkBMIResult() {
    if (result > 25)
      return 'Over Weight';
    else if (result >= 18.5)
      return 'Normal';
    else
      return 'Under Weight';
  }

  String QueryBMIResult() {
    if (result > 25)
      return '18.5 -25 kg/m2';
    else if (result >= 18.5)
      return '18.5 -25 kg/m2';
    else
      return '18.5 -25 kg/m2';
  }
}
