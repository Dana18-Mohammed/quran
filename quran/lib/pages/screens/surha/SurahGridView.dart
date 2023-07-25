import 'package:flutter/material.dart';
import 'package:quran/pages/screens/surha/surha_page.dart';
import 'package:quran/utiliese/to_arabic_convertor.dart';

import '../../../utiliese/constants.dart';

class SurahGridView extends StatelessWidget {
  const SurahGridView({Key? key, required this.quran}) : super(key: key);

  final List<dynamic> quran;

  @override
  Widget build(BuildContext context) {
    int k;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 114,
        itemBuilder: (context, i) {
          k = i;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primaryColor1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            '${(++k).toString().toArabicNumbers}. ',
                            style: suraNameStyle,
                          ),
                          Text(
                            surhaNameList[i]['name'],
                            style: suraNameStyle,
                            textDirection: TextDirection.rtl,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '(${surhaNameList[i]['type']}) ',
                            style: suraNoVerseStyle,
                            textDirection: TextDirection.rtl,
                          ),
                          Text(
                            (noOfSurhaVerses[i]).toString().toArabicNumbers,
                            style: suraNoVerseStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPressed: () {
                    fabIsClicked = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SurhaBuilder(
                          arabic: quran[0],
                          surah: i,
                          surhaName: surhaNameList[i]['name'],
                          ayah: 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
