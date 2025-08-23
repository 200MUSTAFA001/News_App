import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/functions/delete_cache_function.dart';
import '../../data/localization/localitation_class.dart';
import '../widgets/theme_mode_switch.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key, required this.mode});

  final RxBool mode;
  final box = GetStorage();
  final languages = <String>['en', 'ar'].obs;
  final lang = ''.obs;
  final langBool = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr, style: GoogleFonts.aBeeZee(fontSize: 20)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            Obx(() {
              return ThemeModeSwitch(mode: mode, modeObx: mode.value);
            }),
            Obx(() {
              lang.value = box.read("buttonvalue") ?? "ar";
              return ListTile(
                title: Text('Language'.tr,
                    style: GoogleFonts.aBeeZee(fontSize: 26)),
                trailing: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
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
                      value: lang.value,
                      items: languages.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child:
                              Text(item, style: const TextStyle(fontSize: 16)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value == "en") {
                          lang.value = "en";
                          box.write("buttonvalue", lang.value);
                          langBool.value = false;
                          Get.updateLocale(translation(langBool.value));
                          box.write("langkey", langBool.value);
                        } else {
                          lang.value = "ar";
                          box.write("buttonvalue", lang.value);
                          langBool.value = true;
                          Get.updateLocale(translation(langBool.value));
                          box.write("langkey", langBool.value);
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
        ),
      ),
    );
  }
}
