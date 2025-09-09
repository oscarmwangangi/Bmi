import 'package:flutter/material.dart';
import 'dart:math';

class calculatorBMI {
  calculatorBMI({this.weight, this.height});

  final int? height;
  final int? weight;

  String CalculateBMI(){
    double bmi = weight! / pow(height! / 100, 2);
  return bmi.toStringAsFixed(1); // 1 decimal place
}
  String getResult() {
    double bmi = weight! / pow(height! / 100, 2);

    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
  String getInterpretation() {
    double bmi = weight! / pow(height! / 100, 2);

    if (bmi >= 25) {
      return 'Try to exercise more and maintain a healthy diet.';
    } else if (bmi > 18.5) {
      return 'Great job! You have a normal body weight.';
    } else {
      return 'You should eat a bit more and take care of your nutrition.';
    }
  }
}