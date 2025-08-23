import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/functions/get_stored_articles.dart';
import '../../../data/models/article_model.dart';
import '../../widgets/article_card.dart';
import '../article_details_page/article_page.dart';

class SavedArticlesPage extends StatefulWidget {
  const SavedArticlesPage({super.key});

  @override
  State<SavedArticlesPage> createState() => _SavedArticlesPageState();
}

class _SavedArticlesPageState extends State<SavedArticlesPage> {
  final box = GetStorage();
  final articles = <Article>[].obs;
  final isSaveButtonSelected = false.obs;

  @override
  void initState() {
    super.initState();
    articles.addAll(getStoredArticles());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Saved Articles'.tr,
            style: GoogleFonts.aBeeZee(fontSize: 20),
          ),
        ),
        body: ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Get.to(
                () => const ArticlePage(),
                arguments: articles[index],
                transition: Transition.cupertinoDialog,
                opaque: false,
              );
            },
            child: ArticleCard(article: articles[index]),
          ),
        ),
      );
    });
  }
}
