import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../data/models/article_model.dart';
import '../../../data/service/news_service.dart';
import '../../widgets/article_card.dart';
import '../../widgets/home_page_widgets/custom_drawer.dart';
import '../../widgets/home_page_widgets/custom_search_bar.dart';
import '../../widgets/home_page_widgets/drop_down_button.dart';
import '../../widgets/home_page_widgets/no_articles_widget.dart';
import '../../widgets/home_page_widgets/user_tile.dart';
import '../../widgets/shimmer_card.dart';
import '../article_details_page/article_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.mode});
  final RxBool mode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final textController = TextEditingController();

  final isSelected = (-1).obs;
  final isLoading = true.obs;

  final choices = [
    "top",
    'sports',
    'business',
    'technology',
    'world',
    'lifestyle',
    'tourism',
    'environment',
    'entertainment'
  ];

  final query = 'general'.obs;
  final articles = <Article>[].obs;
  final articlesLanguage = 'en'.obs;
  final nextPage = "".obs;
  final savedArticles = <Article>[];
  final isSaveButtonSelected = false.obs;

  @override
  void initState() {
    super.initState();

    getDataByQuery(query.value, articlesLanguage.value);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (nextPage.value.isNotEmpty) {
          getMoreArticles();
        }
      }
    });
  }

  Future<void> getDataByQuery(String query, String lang) async {
    isLoading.value = true;
    final result = await NewsService().fetchNewsByQuery(query, lang);

    await Future.delayed((const Duration(seconds: 1)), () {
      if (result != null) {
        articles.assignAll(result.results);
        if (result.nextPage != null) {
          nextPage.value = result.nextPage!;
        }
      }
    });
    isLoading.value = false;
  }

  Future<void> getDataByCategory(String category, String lang) async {
    isLoading.value = true;
    final result = await NewsService().fetchNewsByCategory(category, lang);

    await Future.delayed((const Duration(seconds: 1)), () {
      if (result != null) {
        articles.assignAll(result.results);
        if (result.nextPage != null) {
          nextPage.value = result.nextPage!;
        }
      }
    });
    isLoading.value = false;
  }

  Future<void> getMoreArticles() async {
    final response = await NextPage()
        .fetchMoreArticles(query.value, articlesLanguage.value, nextPage.value);

    if (response != null && nextPage.value.isNotEmpty) {
      articles.addAll(response.results);
      nextPage.value = response.nextPage ?? "";
    }
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    getDataByQuery(query.value, articlesLanguage.value);
  }

  @override
  void dispose() {
    scrollController.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: CustomDrawer(mode: widget.mode),
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 80,
          onRefresh: onRefresh,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              const SliverAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    UserTile(),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomSearchBar(
                      controller: textController,
                      onSubmitted: (value) {
                        query.value = textController.text;
                        getDataByQuery(query.value, articlesLanguage.value);
                      },
                      onPressed: () {
                        query.value = textController.text;
                        getDataByQuery(query.value, articlesLanguage.value);
                      },
                      dropDownButtonWidget: Obx(() {
                        return CustomDropDownButton(
                          currentItem: articlesLanguage.value,
                          onChanged: (value) {
                            articlesLanguage.value = value;
                            getDataByQuery(query.value, articlesLanguage.value);
                          },
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(6),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Wrap(
                        spacing: 5.0,
                        children: List.generate(choices.length, (index) {
                          return Obx(() {
                            return ChoiceChip(
                              shape: const StadiumBorder(),
                              label: Text(choices[index].tr),
                              selected: isSelected.value == index,
                              onSelected: (selected) async {
                                if (isSelected.value == index) {
                                  isSelected.value = -1;
                                  textController.clear();
                                  query.value = 'top';
                                  getDataByQuery(
                                      query.value, articlesLanguage.value);
                                } else {
                                  isSelected.value = index;
                                  query.value = choices[index];
                                  getDataByCategory(
                                      query.value, articlesLanguage.value);
                                  textController.clear();
                                }
                              },
                            );
                          });
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() {
                return limitError.value == false
                    ? SliverList.builder(
                        itemCount: isLoading.value ? 5 : articles.length,
                        itemBuilder: (context, index) => Skeletonizer(
                          enabled: isLoading.value,
                          child: isLoading.value
                              ? const ShimmerCard()
                              : GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      () => const ArticlePage(),
                                      transition: Transition.fade,
                                      arguments: articles[index],
                                    );
                                  },
                                  child: ArticleCard(article: articles[index]),
                                ),
                        ),
                      )
                    : const NoArticlesWidget();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
