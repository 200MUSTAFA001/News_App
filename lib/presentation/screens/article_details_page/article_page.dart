import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/functions/fill_article_page_variables_function.dart';
import '../../../data/models/article_model.dart';
import '../../widgets/article_card.dart';
import 'article_web_view_page.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final image = "".obs;
  final title = "".obs;
  final sourceImage = "".obs;
  final sourceName = "".obs;
  final publishDate = "".obs;
  final description = "".obs;
  final sourcePage = "".obs;
  final articlePage = "".obs;

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
            expandedHeight: context.height * 0.45,
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: image.value,
                fit: BoxFit.cover,
                errorWidget: (context, error, _) => Image.asset(
                  "assets/images/placeholder.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            leadingWidth: 72,
            leading: FloatingActionButton(
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
            ).paddingOnly(left: 16),
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
                Text(
                  title.value,
                  style: GoogleFonts.robotoSlab(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ).paddingOnly(left: 22, right: 22, top: 8, bottom: 8),
                Container(
                  margin: const EdgeInsets.only(right: 14, left: 14, top: 10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(40)),
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Get.to(const WebViewPage(),
                            arguments: sourcePage.value);
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
                Text(
                  description.value,
                  style: GoogleFonts.firaSans(fontSize: 20),
                ).paddingAll(22),
                GestureDetector(
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
                ).paddingOnly(top: 5, bottom: 50, right: 18, left: 18),
              ],
            ),
          )
        ],
      ),
    );
  }
}
