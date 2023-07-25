import 'package:flutter/material.dart';
import 'package:quran/pages/screens/surha/SurahGridView.dart';
import 'package:quran/pages/screens/surha/surha_page.dart';
import '../network/read_json.dart';
import '../utiliese/constants.dart';
import 'screens/drawer_screens/drawer_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'المتابعة من حيث توقفت',
        backgroundColor: primaryColor3,
        onPressed: _handleBookmarkButtonPress,
        child: const Icon(Icons.bookmark),
      ),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "فهرس السور",
          style: appBarTextStyle,
        ),
        backgroundColor: primaryColor3,
        primary: true,
        textTheme: const TextTheme(),
      ),
      body: FutureBuilder(
        future: Asset().readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return SurahGridView(quran: snapshot.data);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  void _handleBookmarkButtonPress() async {
    fabIsClicked = true;
    await readBookmark();
    print(await readBookmark());
    if (await readBookmark() == true) {
      print('in read bok to go !');
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurhaBuilder(
              arabic: quran[0],
              surah: bookmarkedSura - 1,
              surhaName: surhaNameList[bookmarkedSura - 1]['name'],
              ayah: bookmarkedAyah,
            ),
          ),
        );
      }
    }
  }
}
