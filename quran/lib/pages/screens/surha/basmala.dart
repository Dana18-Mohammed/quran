import 'package:flutter/material.dart';
import 'package:quran/utiliese/constants.dart';

import '../../../network/read_json.dart';

class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Text(
          "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ",
          style: TextStyle(fontFamily: arabicFontFamily, fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }

  get_basmla() async {
    final data = await Asset().readJson();
    final basmla = data[0];
    print(basmla[0]['aya_text']);
    return basmla;
  }
}
