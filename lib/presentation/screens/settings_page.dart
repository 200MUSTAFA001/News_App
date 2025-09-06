import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/functions/delete_cache_function.dart';
import '../../data/functions/local_storage_functions.dart';
import '../widgets/theme_mode_switch.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key, required this.mode});

  final RxBool mode;
  final box = GetStorage();
  final languages = [
    const DropdownMenuItem<String>(
        value: "en", child: Text("en", style: TextStyle(fontSize: 16))),
    const DropdownMenuItem<String>(
        value: "ar", child: Text("ar", style: TextStyle(fontSize: 16))),
  ];
  final dropDownButtonValue = ''.obs;
  final languageBool = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr, style: GoogleFonts.aBeeZee(fontSize: 20)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          ThemeModeSwitch(mode: mode),
          Obx(() {
            dropDownButtonValue.value = box.read("buttonvalue") ?? "en";
            return ListTile(
              title:
                  Text('Language'.tr, style: GoogleFonts.aBeeZee(fontSize: 26)),
              trailing: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: context.theme.primaryColor,
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: Colors.black12,
                      blurRadius: 10,
                    ),
                  ],
                ),
                width: 80,
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: dropDownButtonValue.value,
                    items: languages,
                    onChanged: (value) {
                      if (value == "en") {
                        saveLanguageValue(
                            dropDownButtonValue, languageBool, false, "en");
                      } else {
                        saveLanguageValue(
                            dropDownButtonValue, languageBool, true, "ar");
                      }
                    },
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            );
          }),
          ListTile(
            title: Text(
              'Delete Cache'.tr,
              style: GoogleFonts.aBeeZee(fontSize: 26),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                deleteCache();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                "delete".tr,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ).paddingOnly(top: 50, left: 20),
    );
  }
}
