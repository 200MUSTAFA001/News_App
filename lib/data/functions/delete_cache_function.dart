import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

Future<void> deleteCache() async {
  try {
    final directory = await getTemporaryDirectory();
    if (directory.existsSync()) {
      directory.listSync().forEach((entity) {
        try {
          if (entity is File) {
            entity.deleteSync();
          } else if (entity is Directory) {
            entity.deleteSync(recursive: true);
          }
        } catch (e) {
          Get.snackbar("error".tr, "error".tr,
              backgroundColor: Colors.red, colorText: Colors.white);
        }
      });
      Get.snackbar("Deleted".tr, "Cache data deleted".tr,
          backgroundColor: Colors.green, colorText: Colors.white);
    }
  } catch (e) {
    Get.snackbar("error".tr, "error".tr, backgroundColor: Colors.red);
  }
}
