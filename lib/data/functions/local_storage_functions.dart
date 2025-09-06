import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../localization/localization_class.dart';
import '../models/article_model.dart';

final box = GetStorage();

void writeArticles(List<Article> articles) {
  final listArticles = articles.map((article) => article.toJson()).toList();
  box.write('articles', listArticles);
}

//
//
List<Article> readArticles() {
  final List<dynamic>? data = box.read('articles');
  if (data != null) {
    return data
        .map<Article>(
          (article) => Article.fromJson(article as Map<String, dynamic>),
        )
        .toList();
  }
  return [];
}
//
//

void saveLanguageValue(
  RxString lang,
  RxBool langBool,
  bool selectedLangBool,
  String selectedLangString,
) {
  lang.value = selectedLangString;
  box.write("buttonvalue", lang.value);
  langBool.value = selectedLangBool;
  Get.updateLocale(translation(langBool.value));
  box.write("langkey", langBool.value);
}
