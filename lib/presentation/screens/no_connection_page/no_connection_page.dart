import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../app_router.dart';
import '../../../data/functions/local_storage_functions.dart';
import '../saved_articles_page/saved_articles_page.dart';

class NoConnectionPage extends StatelessWidget {
  NoConnectionPage({super.key});

  final mode = RxBool(box.read("mode") ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          spacing: 18,
          children: [
            SizedBox(
              height: context.height * 0.08,
            ),
            Transform.scale(
              scale: 1.5,
              child: Lottie.asset(
                "assets/NoConnection.json",
                height: context.height * 0.3,
                width: context.width * 0.8,
                repeat: false,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "No internet connection".tr,
              style: GoogleFonts.dosis(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Please check your internet connection".tr,
              style: GoogleFonts.dosis(
                fontSize: 26,
              ),
              textAlign: TextAlign.center,
            ).paddingOnly(left: 40, right: 40),
            SizedBox(
              height: context.height * 0.08,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(AppRouter(mode: mode));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  context.width * 0.8,
                  context.height * 0.08,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 10,
              ),
              child: Text(
                "Try again".tr,
                style: TextStyle(
                  fontSize: 26,
                  color: context.theme.primaryColorDark,
                  letterSpacing: 2,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(const SavedArticlesPage());
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  context.width * 0.8,
                  context.height * 0.08,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 10,
              ),
              child: Text(
                "Saved Articles".tr,
                style: TextStyle(
                  fontSize: 26,
                  color: context.theme.primaryColorDark,
                  letterSpacing: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
