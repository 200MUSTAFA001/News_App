import 'package:flutter_api_app/data/functions/write_and_read_local_storage_functions.dart';

import '../models/article_model.dart';

void storeArticle(List<Article> articles) {
  final listArticles = articles.map((article) => article.toJson()).toList();
  box.write('articles', listArticles);
}
