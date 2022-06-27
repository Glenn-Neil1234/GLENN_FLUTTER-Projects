import 'package:bmi_calculator_app/input_page.dart';
import 'package:bmi_calculator_app/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_buttons.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.Interpretation,
      required this.healthtiip});
  final String bmiResult;
  final String Interpretation;
  final String healthtiip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            height: 70.0,
            child: Center(
              child: Text(
                'Your Result',
                style: Ktextlabel,
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Kinaccolors,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Interpretation.toUpperCase(),
                    style: resulttext,
                  ),
                  Text(
                    bmiResult,
                    style: bmires,
                  ),
                  Text(
                    healthtiip,
                    textAlign: TextAlign.center,
                    style: resutext,
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          bottomButton(
              buttonTitle: 'RE-CALCULATE BMI',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
              })
        ],
      ),
    );
  }
}
