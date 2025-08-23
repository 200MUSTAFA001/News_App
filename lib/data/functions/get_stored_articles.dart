import 'package:flutter_api_app/data/functions/write_and_read_local_storage_functions.dart';

import '../models/article_model.dart';

List<Article> getStoredArticles() {
  final List<dynamic> data = box.read('articles');
  return data
      .map<Article>(
        (article) => Article.fromJson(article as Map<String, dynamic>),
      )
      .toList();
}
