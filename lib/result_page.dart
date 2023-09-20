import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0a0e21),
        title: const Center(
          child: Text('BMI Calculator'),
        ),
      ),
      body: Text('Hello'),
    );
  }
}
