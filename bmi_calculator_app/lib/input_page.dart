import 'package:bmi_calculator_app/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'reusable_column.dart';
import 'roundicon_button.dart';
import 'results_page.dart';
import 'bottom_buttons.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Color MaleCardColor = inaccolors;
  // Color FemaleCardColor = inaccolors;

  Gender? gender;
  int height = 120;
  int weight = 60;
  int age = 10;
  // void updatecolor(Gender gender) {

  //   if (gender == Gender.male) {
  //     if (MaleCardColor == inaccolors) {
  //       MaleCardColor = accolors;
  //       FemaleCardColor = inaccolors;
  //     } else {
  //       MaleCardColor = inaccolors;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (FemaleCardColor == inaccolors) {
  //       FemaleCardColor = accolors;
  //       MaleCardColor = inaccolors;
  //     } else {
  //       FemaleCardColor = inaccolors;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male ? Kaccolors : Kinaccolors,
                    cardChild: ReusableColumn(
                      ikons: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female ? Kaccolors : Kinaccolors,
                    cardChild: ReusableColumn(
                      ikons: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: Kaccolors,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: KlabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: Ktextlabel,
                      ),
                      Text(
                        'cm',
                        style: KlabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: Ktextlabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: KlabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: Ktextlabel,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          bottomButton(
              buttonTitle: 'CALCULATE BMI',
              onTap: () {
                CalculatorBrain calculatorBrain =
                    CalculatorBrain(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calculatorBrain.bmicalculator(),
                      Interpretation: calculatorBrain.getInterpretation(),
                      healthtiip: calculatorBrain.getHealthtip(),
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
