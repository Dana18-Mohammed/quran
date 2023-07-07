import 'dart:math';

import 'package:bmi/pages/widgets/card_data.dart';
import 'package:bmi/pages/widgets/card_widget.dart';
import 'package:bmi/pages/widgets/raw_button.dart';
import 'package:bmi/result/bmi_result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../result/bmi_result.dart';
// import '../widgets/card_widget.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  late int height = 120;
  int age = 20;
  double weight = 40;
  Gender? selectedGender;
  bool? isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: const Text(
          textAlign: TextAlign.center,
          "BMI Calculator",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardWidget(
                color:
                    selectedGender == Gender.male ? ActiveColor : inActiveColor,
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: const CardData(
                  title: 'Male',
                  icon: FontAwesomeIcons.mars,
                ),
              ),
              CardWidget(
                color: selectedGender == Gender.female
                    ? ActiveColor
                    : inActiveColor,
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: const CardData(
                  title: 'Female',
                  icon: FontAwesomeIcons.venus,
                ),
              ),
            ],
          )),
          CardWidget(
              color: inActiveColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height'.toUpperCase(),
                    style: titleTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: NumTextStyle,
                      ),
                      Text(
                        'cm',
                        style: titleTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        trackHeight: 1,
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: ActiveColor,
                        thumbColor: const Color(0xFFfd3225),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayColor: btn),
                    child: Slider(
                        min: 10,
                        max: 200,
                        value: height.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            height = value.round();
                          });
                          print(height);
                        }),
                  )
                ],
              )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CardWidget(
                  color: inActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: titleTextStyle,
                      ),
                      Text(
                        '${weight.round()}',
                        style: NumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                              backgroundColor: ActiveColor,
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  ++weight;
                                  print(weight);
                                });
                              }),
                          const SizedBox(
                            width: 24,
                          ),
                          FloatingActionButton(
                              backgroundColor: ActiveColor,
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  --weight;
                                  print(weight);
                                });
                              })
                        ],
                      )
                    ],
                  )),
              CardWidget(
                  color: inActiveColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: titleTextStyle,
                      ),
                      Text(
                        '$age',
                        style: NumTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                              backgroundColor: ActiveColor,
                              child: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  ++age;
                                  print(age);
                                });
                              }),
                          const SizedBox(
                            width: 24,
                          ),
                          FloatingActionButton(
                              backgroundColor: ActiveColor,
                              child: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  --age;
                                  print(age);
                                });
                              }),
                        ],
                      )
                    ],
                  )),
            ],
          )),
          TextButton(
            onPressed: () {
              BMIResult bmiResult = BMIResult(weight.round(), height);
              print(bmiResult.calculateBMI());
              print(bmiResult.checkBMIResult());
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(bmiResult.checkBMIResult()),
                duration: Duration(seconds: 1),
                action: SnackBarAction(
                  label: '',
                  onPressed: () {},
                ),
              ));
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BmiResultScreen(
                            weight: weight.round(),
                            height: height,
                            result: bmiResult.checkBMIResult(),
                            yourBmi: bmiResult.calculateBMI(),
                          )));
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              alignment: Alignment.center,
              color: btn,
              height: 75,
              width: double.infinity,
              child: Text(
                'CALCULATE',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum Gender { male, female }
