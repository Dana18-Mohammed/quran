import 'package:flutter/material.dart';
import 'package:quran/pages/screens/tafser_ayha/tafser_ayah.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quran/utiliese/constants.dart';
import '../../../network/network_helper.dart';
import 'basmala.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();
bool fabIsClicked = true;

class SurhaBuilder extends StatefulWidget {
  final surah;
  final arabic;
  final surhaName;
  int ayah;
  SurhaBuilder(
      {Key? key, this.surah, this.arabic, this.surhaName, required this.ayah})
      : super(key: key);

  @override
  State<SurhaBuilder> createState() => _SurhaBuilderState();
}

class _SurhaBuilderState extends State<SurhaBuilder> {
  bool view = true;
  int surahNo = 1;
  int ayahNo = 1;
  Future<String> getTafserData(surahNo, ayahNo) async {
    final tafser = await NetworkHelper().getTafser(surahNo, ayahNo);
    print(tafser['text']);
    return tafser['text'];
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      jumpToAyah();
    });
    getTafserData(surahNo, ayahNo);
    // print( ());
    super.initState();
  }

  void showCopySnackBar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('تم نسخ الآية'),
      backgroundColor: Colors.grey,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.arabic[index + previousVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontsize,
                  fontFamily: arabicFontFamily,
                  color: const Color.fromARGB(196, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  SafeArea SingleSuraBuilder(LenghtOfSura) {
    String fullSura = '';
    int previousVerses = 0;
    if (widget.surah + 1 != 1) {
      for (int i = widget.surah - 1; i >= 0; i--) {
        previousVerses = previousVerses + noOfSurhaVerses[i];
      }
    }

    if (!view)
      for (int i = 0; i < LenghtOfSura; i++) {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
      }

    return SafeArea(
      child: Container(
        color: const Color.fromARGB(255, 253, 251, 240),
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      (index != 0) || (widget.surah == 0) || (widget.surah == 8)
                          ? const Text('')
                          : const RetunBasmala(),
                      Container(
                        color: index % 2 != 0
                            ? const Color.fromARGB(255, 253, 251, 240)
                            : const Color.fromARGB(255, 253, 247, 230),
                        child: PopupMenuButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: verseBuilder(index, previousVerses),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      saveBookMarks(widget.surah + 1, index);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Icon(Icons.bookmark_add,
                                            color: primaryColor3),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('وضع علامة'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    onTap: () async {
                                      String tafsirText = await getTafserData(
                                          widget.surah + 1, index);
                                      if (mounted) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => TafsirScreen(
                                                tafsirText: tafsirText),
                                          ),
                                        );
                                      }
                                    },
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(
                                          Icons.edit_calendar_sharp,
                                          color: primaryColor3,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('تفسير الآية'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    onTap: () async {
                                      String ayahText =
                                          widget.arabic[index + previousVerses]
                                              ['aya_text_emlaey'];
                                      Share.share(ayahText);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(Icons.share, color: primaryColor3),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('مشاركة'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      String verseText =
                                          widget.arabic[index + previousVerses]
                                              ['aya_text_emlaey'];
                                      copyVerseToClipboard(verseText);
                                      showCopySnackBar(context);
                                    },
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(Icons.copy, color: primaryColor3),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('نسخ الاية'),
                                      ],
                                    ),
                                  ),
                                ]),
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: LenghtOfSura,
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            widget.surah + 1 != 1 && widget.surah + 1 != 9
                                ? const RetunBasmala()
                                : const Text(''),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                fullSura, //mushaf mode
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: mushafFontsize,
                                  fontFamily: arabicFontFamily,
                                  color: const Color.fromARGB(196, 44, 44, 44),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int LengthOfSura = noOfSurhaVerses[widget.surah];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor3,
          elevation: 0,
          leading: Tooltip(
            message: 'Mushaf Mode',
            child: TextButton(
              child: const Icon(
                Icons.chrome_reader_mode,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  view = !view;
                });
              },
            ),
          ),
          centerTitle: true,
          title: Text(
            // widget.
            widget.surhaName,
            textAlign: TextAlign.center,
            style: suraTextStyle,
          ),
        ),
        body: SingleSuraBuilder(LengthOfSura),
      ),
    );
  }

  void jumpToAyah() {
    if (fabIsClicked) {
      itemScrollController.scrollTo(
          index: widget.ayah,
          duration: const Duration(seconds: 1),
          curve: Curves.decelerate);
    }
  }

  void saveBookMarks(surah, ayah) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("surah", surah);
    await prefs.setInt("ayah", ayah);
  }

  void copyVerseToClipboard(String verseText) {
    Clipboard.setData(ClipboardData(text: verseText));
    print(verseText);
  }
}
