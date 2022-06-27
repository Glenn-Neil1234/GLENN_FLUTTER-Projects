import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;
  double _bmi = 0.0;
  String bmicalculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 24 && _bmi < 29) {
      return 'You have an overweight body mass index. Please exercise more';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'You have a normal body maas index. Congrats';
    } else if (_bmi <= 18.5) {
      return 'Yo have an underweight body mass index. You need to eat more healthy';
    } else {
      return 'Yo too fat';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25 && _bmi <= 29) {
      return 'Overweight';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'Normal';
    } else if (_bmi <= 18.5) {
      return 'Underweight';
    } else {
      return 'Obese';
    }
  }

  String getHealthtip() {
    if (_bmi >= 25 && _bmi <= 29) {
      return 'You have an overweight body mass index. Please exercise more';
    } else if (_bmi >= 18.5 && _bmi < 25) {
      return 'You have a normal body mass index. Teach me your ways fitness master';
    } else if (_bmi <= 18.5) {
      return 'You have an underweight body mass index. Please have a healthy diet';
    } else {
      return 'You are Obese';
    }
  }
}
