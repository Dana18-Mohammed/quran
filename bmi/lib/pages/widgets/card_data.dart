import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';

class CardData extends StatelessWidget {
  final String title;
  final IconData icon;
  const CardData({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        const SizedBox(height: 16),
        Text(
          title.toUpperCase(),
          style: titleTextStyle,
        )
      ],
    );
  }
}
