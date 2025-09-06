import 'package:news_app/data/functions/local_storage_functions.dart';

import '../models/article_model.dart';

List<Article> getStoredArticles() {
  final storedList = box.read('articles');
  if (storedList != null) {
    return storedList
        .map<Article>(
          (article) => Article.fromJson(article),
        )
        .toList();
  } else {
    return [];
  }
}
