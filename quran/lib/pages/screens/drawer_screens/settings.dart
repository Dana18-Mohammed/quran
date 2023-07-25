import 'package:flutter/material.dart';
import 'package:quran/utiliese/constants.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "إعدادت الخط",
          ),
          backgroundColor: primaryColor3,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'حجم خط القرآن العربي ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                    value: arabicFontsize,
                    min: 8,
                    max: 60,
                    onChanged: (value) {
                      setState(() {
                        arabicFontsize = value;
                      });
                    },
                  ),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ",
                    style: TextStyle(
                        fontFamily: arabicFontFamily, fontSize: arabicFontsize),
                    textDirection: TextDirection.rtl,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  const Text(
                    'حجم الخط لوضع المصحف ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Slider(
                    value: mushafFontsize,
                    min: 8,
                    max: 50,
                    onChanged: (value) {
                      setState(() {
                        mushafFontsize = value;
                      });
                    },
                  ),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ",
                    style: TextStyle(
                        fontFamily: arabicFontFamily, fontSize: mushafFontsize),
                    textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor3,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              arabicFontsize = 28;
                              mushafFontsize = 28;
                            });
                            saveSetting();
                          },
                          child: const Text('إعادة الضبط')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor3,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            saveSetting();
                            Navigator.of(context).pop();
                          },
                          child: const Text('حفظ')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
