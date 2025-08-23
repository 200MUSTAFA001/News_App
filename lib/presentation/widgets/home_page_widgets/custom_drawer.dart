import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../screens/saved_articles_page/saved_articles_page.dart';
import '../../screens/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.mode,
  });

  final RxBool mode;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 10,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 30,
          children: [
            Text(
              'News App'.tr,
              style: GoogleFonts.aBeeZee(fontSize: 26),
            ),
            ListTile(
              onTap: () {
                Get.back();
              },
              leading: const Icon(Icons.home_filled),
              title: Text(
                'Home'.tr,
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(() => const SavedArticlesPage());
              },
              leading: const Icon(Icons.bookmarks_outlined),
              title: Text(
                'Saved Articles'.tr,
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(
                  () => SettingsPage(
                    mode: mode,
                  ),
                );
              },
              leading: const Icon(Icons.settings),
              title: Text(
                'Settings'.tr,
                style: GoogleFonts.aBeeZee(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
