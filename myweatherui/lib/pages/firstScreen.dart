import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myweatherui/pages/wether_locate.dart';

import '../constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bk1, bk2],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      Image.asset('assets/s1.png'),
      Positioned(
        top: 500,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('Prepaer to ', style: titleTextStyle),
                Text(
                  'be amazed',
                  style: subtitleTextStyle,
                ),
              ],
            ),
            Text('by our weather', style: titleTextStyle),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text('app`s  ', style: subtitleTextStyle),
                Text(
                  'Precision.',
                  style: titleTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: 750,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(secondary),
                    minimumSize: MaterialStateProperty.all(const Size(220, 60)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: secondary, width: 1),
                      ),
                    )),
                child: Text('Register Now', style: txt),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocatScreen()),
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(bk2),
                    minimumSize: MaterialStateProperty.all(const Size(170, 60)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.white, width: 1),
                      ),
                    )),
                child: Text('Sign in', style: button2),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
