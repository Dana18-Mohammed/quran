import 'package:flutter/material.dart';

import '../../../utiliese/constants.dart';

class TafsirScreen extends StatelessWidget {
  final String tafsirText;

  const TafsirScreen({super.key, required this.tafsirText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("تفسير الآية"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          tafsirText,
          style: TextStyle(fontSize: 18, fontFamily: arabicFontFamily),
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
