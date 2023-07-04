import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final int weight;
  final int height;
  final String result;
  const BmiResultScreen(
      {Key? key,
      required this.weight,
      required this.height,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text(
          textAlign: TextAlign.center,
          "BMI Result",
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Weight : $weight',
            style: titleTextStyle,
          ),
          Text(
            'Height : '
            '$height',
            style: titleTextStyle,
          ),
          Text(
            'Result: '
            '$result',
            style: titleTextStyle,
          )
        ],
      ),
    );
  }
}
