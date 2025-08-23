import 'package:flutter/material.dart';
import 'package:flutter_api_app/app_router.dart';
import 'package:flutter_api_app/presentation/screens/saved_articles_page/saved_articles_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../data/functions/write_and_read_local_storage_functions.dart';

class NoConnectionPage extends StatelessWidget {
  NoConnectionPage({super.key});

  final mode = RxBool(box.read("mode") ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: SingleChildScrollView(
        child: Column(
          spacing: 18,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Transform.scale(
              scale: 1.5,
              child: Lottie.asset(
                "assets/NoConnection.json",
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
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
                // color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Text(
                "Please check your internet connection".tr,
                style: GoogleFonts.dosis(
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAll(AppRouter(mode: mode));
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.08,
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
                  color: Theme.of(context).primaryColorDark,
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
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.08,
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
                  color: Theme.of(context).primaryColorDark,
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
