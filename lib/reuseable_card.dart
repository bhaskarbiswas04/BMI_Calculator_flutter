import 'package:flutter/material.dart';

//Class for Container Card.
class ReusableCard extends StatelessWidget {
  ReusableCard({required this.color, this.childCard});

  final Color color;
  final Widget?
      childCard; //the ? makes the parameter nullable. So its optional.

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: childCard,
    );
  }
}
