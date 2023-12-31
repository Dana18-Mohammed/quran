import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String arabicFontFamily = "HafsSmart";
String endAyhaFontFamily = "quran_end";
double arabicFontsize = 28;
double mushafFontsize = 48;
String myLink = 'https://github.com/Dana18-Mohammed';
Uri quranLink = Uri.parse("www.google.com");
int bookmarkedAyah = 1;
int bookmarkedSura = 1;
const primaryColor3 = Color(0xFF606C5D);
const background = Color(0xFFFFF4F4);
const primaryColor1 = Color(0xFFF7E6C4);
const primaryColor2 = Color(0xFFF1C376);
const TextStyle appBarTextStyle = TextStyle(
  //fontFamily: 'quran',
  fontSize: 25,
  // fontWeight: FontWeight.bold,
  shadows: [
    Shadow(
      offset: Offset(1, 1),
      blurRadius: 2.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);
// const primaryColor = Color(0xFFFF711A);
// const primaryColor2 = Color(0xFFFFB000);
// const primaryColor3 = Color(0xFF00A2B5);
const suraNameStyle = TextStyle(
  fontSize: 25,
  color: Colors.black87,
  fontFamily: 'quran',
  shadows: [
    Shadow(
      offset: Offset(.4, .4),
      blurRadius: 1.0,
      color: Color.fromARGB(255, 130, 130, 130),
    )
  ],
);
const suraTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'quran',
    shadows: [
      Shadow(
        offset: Offset(1, 1),
        blurRadius: 2.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ]);
const suraNoVerseStyle = TextStyle(
  fontSize: 18,
  color: Colors.black38,
  fontFamily: 'quran',
  shadows: [
    Shadow(
      offset: Offset(.4, .4),
      blurRadius: 0.8,
      color: Color.fromARGB(255, 130, 130, 130),
    )
  ],
);
const drawerTextStyle =
    TextStyle(fontWeight: FontWeight.bold, color: primaryColor3, fontSize: 18);
Future saveSetting() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt("arabicFontsize", arabicFontsize.toInt());
  await prefs.setInt("mushafFontsize", mushafFontsize.toInt());
}

Future getSetting() async {
  try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    arabicFontsize = await prefs.getInt("arabicFontsize")!.toDouble();
    mushafFontsize = await prefs.getInt("mushafFontsize")!.toDouble();
  } catch (_) {
    arabicFontsize = 28;
    mushafFontsize = 48;
  }
}

readBookmark() async {
  print("read book mark called");
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}

List<Map> surhaNameList = [
  {"surah": "1", "name": "الفاتحة", "type": "مكية"},
  {"surah": "2", "name": "البقرة", "type": "مدنية"},
  {"surah": "3", "name": "آل عمران", "type": "مدنية"},
  {"surah": "4", "name": "النساء", "type": "مدنية"},
  {"surah": "5", "name": "المائدة", "type": "مدنية"},
  {"surah": "6", "name": "الأنعام", "type": "مكية"},
  {"surah": "7", "name": "الأعراف", "type": "مكية"},
  {"surah": "8", "name": "الأنفال", "type": "مدنية"},
  {"surah": "9", "name": "التوبة", "type": "مدنية"},
  {"surah": "10", "name": "يونس", "type": "مكية"},
  {"surah": "11", "name": "هود", "type": "مكية"},
  {"surah": "12", "name": "يوسف", "type": "مكية"},
  {"surah": "13", "name": "الرعد", "type": "مكية"},
  {"surah": "14", "name": "ابراهيم", "type": "مكية"},
  {"surah": "15", "name": "الحجر", "type": "مكية"},
  {"surah": "16", "name": "النحل", "type": "مكية"},
  {"surah": "17", "name": "الإسراء", "type": "مكية"},
  {"surah": "18", "name": "الكهف", "type": "مكية"},
  {"surah": "19", "name": "مريم", "type": "مكية"},
  {"surah": "20", "name": "طه", "type": "مكية"},
  {"surah": "21", "name": "الأنبياء", "type": "مكية"},
  {"surah": "22", "name": "الحج", "type": "مكية"},
  {"surah": "23", "name": "المؤمنون", "type": "مكية"},
  {"surah": "24", "name": "النور", "type": "مدنية"},
  {"surah": "25", "name": "الفرقان", "type": "مكية"},
  {"surah": "26", "name": "الشعراء", "type": "مكية"},
  {"surah": "27", "name": "النمل", "type": "مكية"},
  {"surah": "28", "name": "القصص", "type": "مكية"},
  {"surah": "29", "name": "العنكبوت", "type": "مكية"},
  {"surah": "30", "name": "الروم", "type": "مكية"},
  {"surah": "31", "name": "لقمان", "type": "مكية"},
  {"surah": "32", "name": "السجدة", "type": "مكية"},
  {"surah": "33", "name": "الأحزاب", "type": "مدنية"},
  {"surah": "34", "name": "سبإ", "type": "مكية"},
  {"surah": "35", "name": "فاطر", "type": "مكية"},
  {"surah": "36", "name": "يس", "type": "مكية"},
  {"surah": "37", "name": "الصافات", "type": "مكية"},
  {"surah": "38", "name": "ص", "type": "مكية"},
  {"surah": "39", "name": "الزمر", "type": "مكية"},
  {"surah": "40", "name": "غافر", "type": "مكية"},
  {"surah": "41", "name": "فصلت", "type": "مكية"},
  {"surah": "42", "name": "الشورى", "type": "مكية"},
  {"surah": "43", "name": "الزخرف", "type": "مكية"},
  {"surah": "44", "name": "الدخان", "type": "مكية"},
  {"surah": "45", "name": "الجاثية", "type": "مكية"},
  {"surah": "46", "name": "الأحقاف", "type": "مكية"},
  {"surah": "47", "name": "محمد", "type": "مدنية"},
  {"surah": "48", "name": "الفتح", "type": "مدنية"},
  {"surah": "49", "name": "الحجرات", "type": "مدنية"},
  {"surah": "50", "name": "ق", "type": "مكية"},
  {"surah": "51", "name": "الذاريات", "type": "مكية"},
  {"surah": "52", "name": "الطور", "type": "مكية"},
  {"surah": "53", "name": "النجم", "type": "مكية"},
  {"surah": "54", "name": "القمر", "type": "مكية"},
  {"surah": "55", "name": "الرحمن", "type": "مكية"},
  {"surah": "56", "name": "الواقعة", "type": "مكية"},
  {"surah": "57", "name": "الحديد", "type": "مدنية"},
  {"surah": "58", "name": "المجادلة", "type": "مدنية"},
  {"surah": "59", "name": "الحشر", "type": "مكية"},
  {"surah": "60", "name": "الممتحنة", "type": "مدنية"},
  {"surah": "61", "name": "الصف", "type": "مكية"},
  {"surah": "62", "name": "الجمعة", "type": "مدنية"},
  {"surah": "63", "name": "المنافقون", "type": "مدنية"},
  {"surah": "64", "name": "التغابن", "type": "مكية"},
  {"surah": "65", "name": "الطلاق", "type": "مدنية"},
  {"surah": "66", "name": "التحريم", "type": "مدنية"},
  {"surah": "67", "name": "الملك", "type": "مكية"},
  {"surah": "68", "name": "القلم", "type": "مكية"},
  {"surah": "69", "name": "الحاقة", "type": "مكية"},
  {"surah": "70", "name": "المعارج", "type": "مكية"},
  {"surah": "71", "name": "نوح", "type": "مكية"},
  {"surah": "72", "name": "الجن", "type": "مكية"},
  {"surah": "73", "name": "المزمل", "type": "مكية"},
  {"surah": "74", "name": "المدثر", "type": "مكية"},
  {"surah": "75", "name": "القيامة", "type": "مكية"},
  {"surah": "76", "name": "الانسان", "type": "مكية"},
  {"surah": "77", "name": "المرسلات", "type": "مكية"},
  {"surah": "78", "name": "النبإ", "type": "مكية"},
  {"surah": "79", "name": "النازعات", "type": "مكية"},
  {"surah": "80", "name": "عبس", "type": "مكية"},
  {"surah": "81", "name": "التكوير", "type": "مكية"},
  {"surah": "82", "name": "الإنفطار", "type": "مكية"},
  {"surah": "83", "name": "المطففين", "type": "مكية"},
  {"surah": "84", "name": "الإنشقاق", "type": "مكية"},
  {"surah": "85", "name": "البروج", "type": "مكية"},
  {"surah": "86", "name": "الطارق", "type": "مكية"},
  {"surah": "87", "name": "الأعلى", "type": "مكية"},
  {"surah": "88", "name": "الغاشية", "type": "مكية"},
  {"surah": "89", "name": "الفجر", "type": "مكية"},
  {"surah": "90", "name": "البلد", "type": "مكية"},
  {"surah": "91", "name": "الشمس", "type": "مكية"},
  {"surah": "92", "name": "الليل", "type": "مكية"},
  {"surah": "93", "name": "الضحى", "type": "مكية"},
  {"surah": "94", "name": "الشرح", "type": "مكية"},
  {"surah": "95", "name": "التين", "type": "مكية"},
  {"surah": "96", "name": "العلق", "type": "مكية"},
  {"surah": "97", "name": "القدر", "type": "مكية"},
  {"surah": "98", "name": "البينة", "type": "مكية"},
  {"surah": "99", "name": "الزلزلة", "type": "مكية"},
  {"surah": "100", "name": "العاديات", "type": "مكية"},
  {"surah": "101", "name": "القارعة", "type": "مكية"},
  {"surah": "102", "name": "التكاثر", "type": "مكية"},
  {"surah": "103", "name": "العصر", "type": "مكية"},
  {"surah": "104", "name": "الهمزة", "type": "مكية"},
  {"surah": "105", "name": "الفيل", "type": "مكية"},
  {"surah": "106", "name": "قريش", "type": "مكية"},
  {"surah": "107", "name": "الماعون", "type": "مكية"},
  {"surah": "108", "name": "الكوثر", "type": "مكية"},
  {"surah": "109", "name": "الكافرون", "type": "مكية"},
  {"surah": "110", "name": "النصر", "type": "مدنية"},
  {"surah": "111", "name": "المسد", "type": "مكية"},
  {"surah": "112", "name": "الإخلاص", "type": "مكية"},
  {"surah": "113", "name": "الفلق", "type": "مكية"},
  {"surah": "114", "name": "الناس", "type": "مكية"}
];

List<int> noOfSurhaVerses = [
  7,
  286,
  200,
  176,
  120,
  165,
  206,
  75,
  129,
  109,
  123,
  111,
  43,
  52,
  99,
  128,
  111,
  110,
  98,
  135,
  112,
  78,
  118,
  64,
  77,
  227,
  93,
  88,
  69,
  60,
  34,
  30,
  73,
  54,
  45,
  83,
  182,
  88,
  75,
  85,
  54,
  53,
  89,
  59,
  37,
  35,
  38,
  29,
  18,
  45,
  60,
  49,
  62,
  55,
  78,
  96,
  29,
  22,
  24,
  13,
  14,
  11,
  11,
  18,
  12,
  12,
  30,
  52,
  52,
  44,
  28,
  28,
  20,
  56,
  40,
  31,
  50,
  40,
  46,
  42,
  29,
  19,
  36,
  25,
  22,
  17,
  19,
  26,
  30,
  20,
  15,
  21,
  11,
  8,
  8,
  19,
  5,
  8,
  8,
  11,
  11,
  8,
  3,
  9,
  5,
  4,
  7,
  3,
  6,
  3,
  5,
  4,
  5,
  6
];

List<int> numberJozz = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30
];
List<int> numberOfVersesInJuz = [
  184,
  111,
  125,
  132,
  124,
  112,
  147,
  142,
  158,
  128,
  150,
  170,
  154,
  227,
  185,
  270,
  189,
  202,
  337,
  170,
  178,
  169,
  356,
  174,
  245,
  195,
  398,
  136,
  430
];
