import 'package:flutter/material.dart';

class RawButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Function()? onPressed;
  const RawButton({
    super.key,
    required this.color,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      fillColor: color,
      onPressed: () {},
      shape: const CircleBorder(),
      child: Icon(icon),
    );
  }
}
