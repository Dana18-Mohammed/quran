import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final bool isMale;
  final int age;
  final double result;

  const BmiResult(this.isMale, this.age, this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue[900],
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 32,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("BMI Result"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildResultText('Gender', isMale ? 'Male' : 'Female'),
              _buildResultText('Age', age.toString()),
              _buildResultText('Result', result.round().toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultText(String title, String value) {
    return Text(
      '$title : $value',
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
