import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/theme_data.dart';

import 'app_router.dart';
import 'data/functions/local_storage_functions.dart';
import 'data/localization/localization_class.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

bool langValue() {
  final lang = box.read("langkey");
  if (lang != null) {
    return lang;
  } else {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final mode = RxBool(box.read("mode") ?? false);
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: translation(langValue()),
        translations: MyTranslations(),
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode(mode.value),
        home: AppRouter(mode: mode),
      );
    });
  }
}
