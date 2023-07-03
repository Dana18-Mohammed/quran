import 'package:flutter/material.dart';

import '../../constants.dart';

class CardWidget extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final Function()? onTap;
  const CardWidget({
    super.key,
    this.color,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(7)),
        margin: EdgeInsets.all(8),
        child: child,
      ),
    ));
  }
}
