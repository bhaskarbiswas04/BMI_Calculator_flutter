import 'package:flutter/material.dart';

const labelTextStyle =
    TextStyle(color: Colors.grey, fontSize: 18.0, letterSpacing: 2.0);

const iconSize = 80.0;

//Class for the repetative Icon contents
class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: labelTextStyle,
        )
      ],
    );
  }
}