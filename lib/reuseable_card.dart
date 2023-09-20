import 'package:flutter/material.dart';

//Class for Container Card.
class ReusableCard extends StatelessWidget {
  ReusableCard({required this.color, this.childCard, this.onpress});

  final Color color;
  final Widget?
      childCard; //the ? makes the parameter nullable. So its optional.
  final VoidCallback? onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: childCard,
      ),
    );
  }
}
