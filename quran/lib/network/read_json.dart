import 'dart:convert';

import 'package:flutter/services.dart';

List arabic = [];
List quran = [];
List malayalam = [];

class Asset {
  Future readJson() async {
    final String response =
        await rootBundle.loadString("assets/hafs_smart_v8.json");
    final data = json.decode(response);

    arabic = data;
    print(arabic);
    malayalam = data;
    return quran = [arabic, malayalam];
  }
}
