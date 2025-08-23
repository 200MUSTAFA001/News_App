import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_app/data/models/article_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../data/functions/write_and_read_local_storage_functions.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({super.key, required this.article});

  final Article article;

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  final List<Article> savedArticles = [];

  final isSaveButtonSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 14, left: 14, bottom: 20, top: 12),
      child: Container(
        padding: const EdgeInsets.only(top: 18, bottom: 18),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                height: 180,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
                imageUrl: widget.article.imageUrl ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/placeholder.png"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                widget.article.title,
                style: GoogleFonts.robotoSlab(
                    fontSize: 20, fontWeight: FontWeight.w600),
                overflow: TextOverflow.visible,
                maxLines: 2,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                      imageUrl: widget.article.sourceIcon,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline_outlined)),
                ),
                title: Text(
                  widget.article.sourceName,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(formatPublishDate(widget.article.pubDate)),
                trailing: Obx(() {
                  return FloatingActionButton(
                    elevation: 0,
                    backgroundColor: Theme.of(context)
                        .floatingActionButtonTheme
                        .backgroundColor,
                    onPressed: () {
                      savedArticles.assignAll(readArticles());

                      bool alreadySaved = savedArticles
                          .any((a) => a.title == widget.article.title);

                      if (!alreadySaved) {
                        isSaveButtonSelected.value = true;
                        savedArticles.add(widget.article);
                        writeArticles(savedArticles);
                      } else if (alreadySaved) {
                        isSaveButtonSelected.value = false;
                        savedArticles.removeWhere(
                            (a) => a.title == widget.article.title);
                        writeArticles(savedArticles);
                      }
                    },
                    heroTag: null,
                    child: isSaveButtonSelected.value == true
                        ? const Icon(Icons.bookmark)
                        : const Icon(Icons.bookmark_border),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//  to format publish date

String formatPublishDate(String date) {
  DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
  String formattedDate = DateFormat("yyyy-MM-dd   hh:mm a").format(dateTime);
  return formattedDate;
}
