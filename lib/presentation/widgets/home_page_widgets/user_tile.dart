import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../screens/saved_articles_page/saved_articles_page.dart';

class UserTile extends StatelessWidget {
  final time = DateTime.now();

  UserTile({super.key});

  @override
  Widget build(BuildContext context) {
    final day = DateFormat('EEEE').format(time);
    final month = DateFormat('MMMM').format(time);
    return ListTile(
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        width: 50,
        height: 50,
        child: Transform.scale(
            scale: 1.3, child: Image.asset("assets/images/vector.png")),
      ),
      title: Text(
        'Welcome Back!'.tr,
        style: GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text('$day, ${time.day} $month'),
      trailing: IconButton(
        onPressed: () {
          Get.to(() => const SavedArticlesPage());
        },
        icon: const Icon(Icons.bookmarks_outlined),
        tooltip: 'Show Saved Articles'.tr,
        iconSize: 40,
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).cardColor,
          foregroundColor: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
