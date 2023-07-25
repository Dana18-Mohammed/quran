import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<Map<String, dynamic>> getTafser(
      int sura_number, int ayah_number) async {
    http.Response response = await http.get(Uri.parse('http://api.quran-tafseer'
        '.com/tafseer/1/$sura_number/$ayah_number'));
    print('befor');
    if (response.statusCode == 200) {
      print("200 succ");
      print(response.body);
      return jsonDecode(response.body);
    }
    return Future.error("somthing wrong");
  }
}
