import 'package:get_storage/get_storage.dart';

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
