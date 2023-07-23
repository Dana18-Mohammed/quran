import 'dart:ui';

import 'package:flutter/material.dart';
import '../Network_helper/network_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String imageUrl = '';
  String content = '';
  List<dynamic> tags = [];

  @override
  void initState() {
    super.initState();
    fetchDataAndImage();
  }

  Future<void> fetchDataAndImage() async {
    await fetchDataQuote();
    await fetchImage();
  }

  Future<void> fetchDataQuote() async {
    Map<String, dynamic> data = await NetworkHelper().getQuoteData();

    setState(() {
      content = data['content'] ?? 'Failed to fetch content.';
      tags = data['tags'] ?? [];
    });
    print('quote');
  }

  Future<void> fetchImage() async {
    print('image');
    String apiUrl = 'https://random.imagecdn'
        '.app/v1/image?width=500&height=550&category=buildings&format=json';
    if (tags.isNotEmpty) {
      apiUrl = apiUrl.replaceAll('buildings', tags[0].toString());
      String url = await NetworkHelper().getImage(apiUrl);
      setState(() {
        imageUrl = url ?? 'Failed to fetch image.';
      });
    }
  }

  void refreshData() {
    setState(() {
      imageUrl = '';
      content = '';
      tags = [];
    });
    fetchDataAndImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8), BlendMode.dstATop),
              ),
            ),
            constraints: const BoxConstraints.expand(),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.2)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      content,
                      // style: kTempTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(content),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            // const Text(
                            //   'now',
                            //   style: TextStyle(
                            //     fontSize: 30.0,
                            //     fontFamily: 'Spartan MB',
                            //     letterSpacing: 13,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(tags[index]),
                        backgroundColor: Colors.white,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      )
      // SizedBox(
      //   height: 35,
      //   child: ListView.builder(
      //     scrollDirection: Axis.horizontal,
      //     itemCount: tags.length,
      //     itemBuilder: (context, index) {
      //       return Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 8.0),
      //         child: Chip(
      //           label: Text(tags[index]),
      //           backgroundColor: Colors.white,
      //           labelStyle: const TextStyle(color: Colors.black),
      //         ),
      //       );
      //     },
      //   ),
      // ),
      // Positioned(
      //   // top: 200,
      //   child: Expanded(
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Text(
      //         content,
      //         style: const TextStyle(fontSize: 20),
      //       ),
      //     ),
      //   ),
      // ),

      // Center(
      //   child: imageUrl.isNotEmpty
      //       ? Image.network(imageUrl)
      //       : const Text('Image loading or not available'),
      // ),

      ,
      floatingActionButton: FloatingActionButton(
        onPressed: refreshData,
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: 50,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: tags.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.symmetric(horizontal: 8.0),
// child: Chip(
// label: Text(tags[index]),
// backgroundColor: Colors.white,
// labelStyle: const TextStyle(color: Colors.black),
// ),
// );
// },
// ),
// ),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(16.0),
// child: Center(
// child: Text(
// content,
// style: const TextStyle(fontSize: 20),
// ),
// ),
// ),
// ),
// Center(
// child: imageUrl.isNotEmpty
// ? Image.network(imageUrl)
//     : const Text('Image loading or not available'),
// ),
// ],
// ),
