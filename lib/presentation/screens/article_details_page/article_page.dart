import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_app/presentation/screens/article_details_page/article_web_view_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/functions/fill_article_page_variables_function.dart';
import '../../../data/models/article_model.dart';
import '../../widgets/article_card.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final RxString image = "".obs;
  final RxString title = "".obs;
  final RxString sourceImage = "".obs;
  final RxString sourceName = "".obs;
  final RxString publishDate = "".obs;
  final RxString description = "".obs;
  final RxString sourcePage = "".obs;
  final RxString articlePage = "".obs;

  @override
  void initState() {
    super.initState();
    final Article article = Get.arguments;
    fillArticlePageVariables(
      article,
      image,
      title,
      sourceImage,
      sourceName,
      publishDate,
      description,
      sourcePage,
      articlePage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.45,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: image.value,
                fit: BoxFit.cover,
              ),
            ),
            leadingWidth: 72,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: FloatingActionButton(
                elevation: 1,
                backgroundColor: Colors.transparent,
                onPressed: () {
                  Get.back();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
                heroTag: null,
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
            actions: [
              FloatingActionButton(
                elevation: 1,
                backgroundColor: Colors.transparent,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(width: 1, color: Colors.white),
                ),
                heroTag: null,
                child: const Icon(
                  Icons.bookmark_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 20)
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, top: 8, bottom: 8),
                  child: Text(
                    title.value,
                    style: GoogleFonts.robotoSlab(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 14, left: 14, top: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(40)),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Get.to(const WebViewPage(), arguments: sourcePage.value);
                      },
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: sourceImage.value,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      sourceName.value,
                      style: GoogleFonts.ubuntu(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    subtitle: Text(
                      formatPublishDate(publishDate.value),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 22, right: 22, top: 20, bottom: 20),
                  child: Text(
                    description.value,
                    style: GoogleFonts.firaSans(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 50, right: 18, left: 18),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(const WebViewPage(), arguments: articlePage.value);
                    },
                    child: Text(
                      'To See The Full Article Click Here'.tr,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigoAccent.shade400),
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
