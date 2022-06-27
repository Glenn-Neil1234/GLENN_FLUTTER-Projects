import 'package:bmi_calculator_app/results_page.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme:
            ColorScheme.fromSwatch().copyWith(primary: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color.fromARGB(0xFF, 0x0A, 0x0E, 0x21),
      ),
      home: InputPage(),
    );
  }
}
