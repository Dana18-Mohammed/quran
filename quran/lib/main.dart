import 'package:flutter/material.dart';
import 'package:quran/pages/fahras.dart';
import 'package:quran/pages/splash_screen.dart';
import 'package:quran/utiliese/constants.dart';

import 'network/read_json.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Asset().readJson();
      await getSetting();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'القرآن الكريم',
      routes: {
        '/home': (context) => const IndexPage(), // Home screen route
      },
      home: const Directionality(
        textDirection: TextDirection.rtl, // Set the text direction to RTL
        child: SplashScreen(),
      ),
    );
  }
}
