import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/methods.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType {
  male,
  female
} //enums are used to create custom datatype with multiple options.

class InputPage extends StatefulWidget {
  const InputPage({super.key});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;
  int height = 150;
  int weight = 50;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0e21),
        title: const Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    color: selectedGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard:
                        IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    color: selectedGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    childCard: IconContent(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kInactiveCardColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'CM',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                    activeColor: Colors.pink,
                    inactiveColor: Colors.pink[300],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    childCard: weight_and_age_widget(
                      type: 'WEIGHT',
                      defaultTypeNum: weight,
                      onPressedMinus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      onPressedPlus: () {
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kInactiveCardColor,
                    childCard: weight_and_age_widget(
                      type: 'AGE',
                      defaultTypeNum: age,
                      onPressedMinus: () {
                        setState(() {
                          age--;
                        });
                      },
                      onPressedPlus: () {
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    BMIResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    resultInterpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            buttonText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}



// () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const ResultPage(),
//           ),
//         );
//       }