import 'dart:math';

import 'package:flutter/material.dart';
import '../bmi_result.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  bool isMale = false;
  late double height = 120;
  int age = 20;
  int weight = 40;

  void selectGender(bool male) {
    setState(() {
      isMale = male;
    });
  }

  void incrementAge() {
    setState(() {
      age++;
    });
  }

  void decrementAge() {
    setState(() {
      if (age > 0) {
        age--;
      }
    });
  }

  void incrementWeight() {
    setState(() {
      weight++;
    });
  }

  void decrementWeight() {
    setState(() {
      if (weight > 0) {
        weight--;
      }
    });
  }

  void calculateBMI(BuildContext context) {
    double result = weight / pow(height / 100, 2);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BmiResult(isMale, age, result),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () => selectGender(Gender.male),
                      child: GenderSelectionWidget(
                        isSelected: isMale,
                        imagePath: 'assets/images/Male.png',
                        genderText: 'MALE',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () => selectGender(Gender.female),
                      child: GenderSelectionWidget(
                        isSelected: !isMale,
                        imagePath: 'assets/images/Female-icon.png',
                        genderText: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeightSliderWidget(
                height: height,
                onChanged: (value) {
                  setState(() {
                    height = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: AgeWidget(
                      age: age,
                      incrementAge: incrementAge,
                      decrementAge: decrementAge,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: WeightWidget(
                      weight: weight,
                      incrementWeight: incrementWeight,
                      decrementWeight: decrementWeight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: CalculateButton(
              onPressed: () => calculateBMI(context),
            ),
          ),
        ],
      ),
    );
  }
}
