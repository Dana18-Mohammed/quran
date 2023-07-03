import 'package:bmi/constants.dart';
import 'package:bmi/result/bmi_result.dart';
import 'package:flutter/material.dart';

import 'pages/bmi_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          textTheme: TextTheme().copyWith(
            titleLarge: TextStyle(fontSize: 25),
            bodySmall: TextStyle(fontSize: 25, color: Colors.red),
            bodyMedium: TextStyle(fontSize: 30),
          ),
          appBarTheme: AppBarTheme(backgroundColor: primaryColor)),
      initialRoute: '/',
      routes: {
        '/': (context) => const BMIScreen(),
      },
    );
  }
}
