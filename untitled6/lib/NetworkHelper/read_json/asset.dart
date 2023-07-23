import 'dart:convert';
import 'package:flutter/services.dart';

class Asset {
  Future<List<dynamic>> fetchData(int page) async {
    String result = await rootBundle.loadString('assets/hafs_smart_v8.json');
    if (result.isNotEmpty) {
      List<dynamic> ayahs = jsonDecode(result);
      List<dynamic> pageAyah =
          ayahs.where((element) => element['page'] == page).toList();
      // print(pageAyah);
      return pageAyah;
    }
    return Future.error('error');
  }

  // Future<dynamic> fetchSurha() async {
  //   String result = await rootBundle.loadString('assets/hafs_smart_v8.json');
  //   if (result.isNotEmpty) {
  //     List<dynamic> ayahs = jsonDecode(result);
  //     List<dynamic> surahNumbers =
  //         ayahs.map((ayah) => ayah['sura_no']).toList();
  //     Set<dynamic> uniqueSurahNumbers = Set<int>.from(surahNumbers);
  //
  //     return uniqueSurahNumbers.length;
  //   }
  //
  //   throw Exception('Error: Unable to fetch Surah count.');
  // }

  Future<List<dynamic>> fetchSurha() async {
    // int surhaPage = 603;
    String result = await rootBundle.loadString('assets/hafs_smart_v8.json');
    if (result.isNotEmpty) {
      List<dynamic> ayahs = jsonDecode(result);
      List<dynamic>? surhaPage;
      print('in fetch surha');

      List<dynamic> surahNumbers =
          ayahs.map((ayah) => ayah['sura_no']).toList();
      for (int i = 0; i < 6236; ++i) {
        if (surahNumbers[i] == surahNumbers[++i]) {
          surhaPage = ayahs.map((ayah) => ayah['aya_text']).toList();
        }
      }
      // return surhaPage;
      // print(surahNumbers);
      // for (int i = 1; i <= 603; ++i) {
      //   surhaPage = ayah['aya_text'];
      //   print(surhaPage);
      // }
      // surhaPage = ayahs
      //     .where((element) => element['sura_no'] == element[j])
      //     .toList();

      // print(surhaPage.toString());
    }
    return Future.error('error');
  }
}
