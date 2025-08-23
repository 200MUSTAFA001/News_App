import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../models/article_model.dart';

void fillArticlePageVariables(
  Article article,
  RxString image,
  RxString title,
  RxString sourceImage,
  RxString sourceName,
  RxString publishDate,
  RxString description,
  RxString sourcePage,
  RxString articlePage,
) {
  image.value = article.imageUrl ?? "";
  title.value = article.title;
  sourceImage.value = article.sourceIcon;
  sourceName.value = article.sourceName;
  publishDate.value = article.pubDate;
  description.value = article.description ?? "";
  sourcePage.value = article.sourceUrl;
  articlePage.value = article.link;
}
