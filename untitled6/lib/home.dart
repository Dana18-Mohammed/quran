import 'package:flutter/material.dart';
import 'NetworkHelper/read_json/asset.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Asset asset = Asset();
  int pageNumber = 0;
  List<dynamic> ayahs = [];
  double fontSize = 22.0; // Initial font size

  void getData() async {
    ayahs = await asset.fetchData(pageNumber);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onDoubleTap: () {
          setState(() {
            // Toggle font size between 22 and 30
            print('tab');
            fontSize = (fontSize == 22.0) ? 30.0 : 22.0;
          });
        },
        child: SafeArea(
          child: PageView.builder(
            itemBuilder: (context, index) {
              pageNumber = index + 1;
              getData();
              return Row(
                textDirection:
                    pageNumber % 2 == 0 ? TextDirection.rtl : TextDirection.ltr,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 1,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: pageNumber % 2 == 0
                            ? const LinearGradient(
                                colors: [
                                  Color(0xfff1cda6),
                                  Color(0xffffeec6),
                                  Color(0xfffdfcfa),
                                ],
                              )
                            : const LinearGradient(
                                colors: [
                                  Color(0xfffdfcfa),
                                  Color(0xffffeec6),
                                  Color(0xfff1cda6),
                                ],
                              ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  for (int i = 0; i < ayahs.length; i++) ...{
                                    TextSpan(
                                      text: ' ${ayahs[i]['aya_text']} ',
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        fontFamily: 'HafsSmart',
                                      ),
                                    ),
                                  }
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            pageNumber.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: 'HafsSmart',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
