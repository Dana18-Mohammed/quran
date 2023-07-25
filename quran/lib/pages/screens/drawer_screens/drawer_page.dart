import 'package:flutter/material.dart';
import 'package:quran/pages/screens/drawer_screens/settings.dart';
import 'package:quran/utiliese/constants.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../network/read_json.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        // backgroundColor: primaryColor2,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 80,
                  ),
                  const Text(
                    'القرآن الكريم',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryColor2),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: primaryColor3,
              ),
              title: const Text('الإعدادات', style: drawerTextStyle),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.share,
                color: primaryColor3,
              ),
              title: const Text(
                'مشاركة التطبيق',
                style: drawerTextStyle,
              ),
              onTap: () {
                Share.share(myLink);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.rate_review,
                color: primaryColor3,
              ),
              title: const Text(
                'تقييم التطبيق',
                style: drawerTextStyle,
              ),
              onTap: () async {
                if (!await launchUrl(quranLink,
                    mode: LaunchMode.externalApplication)) {
                  throw 'Could not launch $quranLink';
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
