import 'dart:ui';

import 'package:get/get.dart';

Locale translation(bool lang) {
  if (lang == false) {
    return const Locale("en");
  } else {
    return const Locale("ar");
  }
}

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "Dark mode": "Dark mode",
          "Entertainment": "Entertainment",
          "Web View Page": "Web View Page",
          "Home": "Home",
          "Language": "Language",
          "Light mode": "Light mode",
          "News App": "News App",
          "Saved Articles": "Saved Articles",
          "Settings": "Settings",
          "Show Saved Articles": "Show Saved Articles",
          "To See The Full Article Click Here":
              "To See The Full Article Click Here",
          "Welcome Back!": "Welcome Back!",
          "articles": "articles",
          "No internet connection": "No internet connection",
          "Please check your internet connection":
              "Please check your internet connection",
          "Try again": "Try again",
          "top": "top",
          'sports': "sports",
          'business': "business",
          'technology': "technology",
          'world': "world",
          'lifestyle': "lifestyle",
          'tourism': "tourism",
          'environment': "environment",
          'entertainment': "entertainment",
          'Delete Cache': 'Delete Cache',
          "delete": "delete",
          "error": "error",
          "Deleted": "Deleted",
          "Cache data deleted": "Cache data deleted"
        },
        "ar": {
          "Dark mode": "الوضع المظلم",
          "Web View Page": "صفحة المقالة",
          "Home": "الصفحة الرئيسية",
          "Language": "اللغة",
          "Light mode": "الوضع الفاتح",
          "News App": "تطبيق الاخبار",
          "Saved Articles": "المقالات المحفوظة",
          "Settings": "الأعدادات",
          "Show Saved Articles": "المقالات المحفوطة",
          "To See The Full Article Click Here": "لرؤية المقالة كاملة اضغط هنا",
          "Welcome Back!": "مرحبا بك !",
          "general": "اخر الاخبار",
          "No internet connection": "لا يوجد اتصال بالأنترنت",
          "Please check your internet connection":
              "يرجي التحقق من اتصال الأنترنت الخاص بك",
          "Try again": "حاول مرة اخري",
          "top": "الأكثر بحثاً",
          'sports': "رياضة",
          'business': "أعمال",
          'technology': "تكنولوجيا",
          'world': "ثقافة",
          'lifestyle': "أسلوب حياة",
          'tourism': "سياحة",
          'environment': "البيئة",
          'entertainment': "ترفيه",
          'Delete Cache': "حذف الذاكرة المؤقتة",
          "delete": "حذف",
          "error": "حدث خطأ",
          "Deleted": "تم الحذف",
          "Cache data deleted": "تم حذف الذاكرة المؤقتة بنجاح"
        },
      };
}
