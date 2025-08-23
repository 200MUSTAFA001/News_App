import 'package:json_annotation/json_annotation.dart';

import 'article_model.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String status;
  final int totalResults;
  final List<Article> results;
  final String? nextPage;

  NewsModel({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$modelsFromJson(json);
  Map<String, dynamic> toJson() => _$modelsToJson(this);
}
