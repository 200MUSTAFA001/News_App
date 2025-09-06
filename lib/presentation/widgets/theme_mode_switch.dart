import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme_data.dart';

class ThemeModeSwitch extends StatelessWidget {
  final RxBool mode;
  final box = GetStorage();

  ThemeModeSwitch({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SwitchListTile(
          title: Text(
            !mode.value ? 'Light mode'.tr : 'Dark mode'.tr,
            style:
                GoogleFonts.aBeeZee(fontSize: 26, fontWeight: FontWeight.w400),
          ),
          activeColor: Colors.blue,
          value: mode.value,
          onChanged: (value) {
            mode.value = !mode.value;
            value = mode.value;
            Get.changeTheme(!mode.value ? lightTheme : darkTheme);
            box.write('mode', mode.value);
          });
    });
  }
}
