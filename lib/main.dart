import 'package:flutter/material.dart';
import 'package:flutter_api_app/app_router.dart';
import 'package:flutter_api_app/theme_data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/functions/write_and_read_local_storage_functions.dart';
import 'data/localization/localitation_class.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = RxBool(box.read("mode") ?? false);
    final lang = box.read("langkey") as bool;
    return Obx(() {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: translation(lang),
          translations: MyTranslations(),
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode(mode.value),
          home: AppRouter(mode: mode));
    });
  }
}
