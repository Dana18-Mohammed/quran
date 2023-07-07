import 'package:bmi/constants.dart';
import 'package:bmi/pages/bmi_Screen.dart';
import 'package:flutter/material.dart';
import '../pages/widgets/card_widget.dart';
import 'package:share_plus/share_plus.dart';

class BmiResultScreen extends StatelessWidget {
  final int weight;
  final int height;
  final double yourBmi;
  final String result;

  const BmiResultScreen(
      {Key? key,
      required this.weight,
      required this.height,
      required this.result,
      required this.yourBmi})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          textAlign: TextAlign.center,
          "BMI Result",
          style: TextStyle(fontSize: 24),
        ),
      ),
      backgroundColor: primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              'Your Result',
              style: resultTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
            child: CardWidget(
                color: inActiveColor,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 36.0, left: 36.0, right: 36.0, bottom: 16),
                      child: Text(
                        result.toUpperCase(),
                        style: resultStringTextStyle,
                      ),
                    ),
                    Text(
                      yourBmi.toStringAsFixed(1),
                      style: BMITextStyle,
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    Text(
                      '$result Bmi range :',
                      style: titleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      QueryBMIResult().toString(),
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Text(
                      AdviseBMIResult().toString(),
                      style: subtitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextButton(
                      onPressed: () {
                        print('share');
                        Share.share('$result ', subject: 'Welcome Message');
                      },
                      child: Container(
                        alignment: Alignment.center,
                        color: primaryColor,
                        height: 65,
                        width: 250,
                        child: Text(
                          'Share Result'.toUpperCase(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                )),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const BMIScreen()));
            },
            child: Container(
              padding: const EdgeInsets.only(bottom: 16),
              alignment: Alignment.center,
              color: btn,
              height: 70,
              width: double.infinity,
              child: Text(
                'RE-CALCULATE YOUR BMI',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          )
        ],
      ),
    );
  }

  String QueryBMIResult() {
    if (yourBmi > 25) {
      return 'above 25 kg/m2';
    } else if (yourBmi >= 18.5) {
      return '18.5 -25 kg/m2';
    } else {
      return 'under 18.5 kg/m2';
    }
  }

  String AdviseBMIResult() {
    if (yourBmi >= 18.5 && yourBmi < 25) {
      return 'Your Have a Normal Body Weight. Good job!';
    } else if (yourBmi > 25) {
      return 'Stay hydrated throughout the day by drinking water.';
    } else {
      return 'Eat regular, balanced meals  variety of '
          'nutrient-dense foods.';
    }
  }
}
