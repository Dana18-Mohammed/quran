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
          textTheme: const TextTheme().copyWith(
            titleLarge: const TextStyle(fontSize: 25),
            titleMedium: const TextStyle(fontSize: 20),
            bodySmall: const TextStyle(fontSize: 25, color: Colors.red),
            bodyMedium: const TextStyle(fontSize: 30),
          ),
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: AppBarTheme(backgroundColor: primaryColor)),
      initialRoute: '/',
      routes: {
        '/': (context) => const BMIScreen(),
      },
    );
  }
}
