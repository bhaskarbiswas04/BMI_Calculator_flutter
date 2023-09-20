import 'package:flutter/material.dart';
import 'constants.dart';
import 'round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Column weight_and_age_widget(
    {required String type,
    required int defaultTypeNum,
    required VoidCallback onPressedMinus,
    required VoidCallback onPressedPlus}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(type, style: kLabelTextStyle),
      Text(
        defaultTypeNum.toString(),
        style: kNumberTextStyle,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundIconButton(
            icon: FontAwesomeIcons.minus,
            onPress: onPressedMinus,
          ),
          const SizedBox(
            width: 10.0,
          ),
          RoundIconButton(
            icon: FontAwesomeIcons.plus,
            onPress: onPressedPlus,
          )
        ],
      )
    ],
  );
}
