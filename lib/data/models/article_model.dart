import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class Article {
  final String articleID;
  final String title;
  final String link;
  final String content;
  final String pubDate;
  final String? description;
  final String pubDateTZ;
  final String? imageUrl;
  final String? videoUrl;
  final String sourceID;
  final String sourceName;
  final int sourcePriority;
  final String sourceUrl;
  final String sourceIcon;
  final String language;
  final String sentiment;
  final String sentimentStats;
  final String aiTag;
  final String aiRegion;
  final String aiOrg;
  final bool duplicate;
  final List<String>? keywords;
  final List<String>? creator;
  final List<String> country;
  final List<String> category;

  Article({
    required this.articleID,
    required this.title,
    required this.link,
    required this.content,
    required this.pubDate,
    required this.description,
    required this.pubDateTZ,
    required this.imageUrl,
    required this.videoUrl,
    required this.sourceID,
    required this.sourceName,
    required this.sourcePriority,
    required this.sourceUrl,
    required this.sourceIcon,
    required this.language,
    required this.sentiment,
    required this.sentimentStats,
    required this.aiTag,
    required this.aiRegion,
    required this.aiOrg,
    required this.duplicate,
    required this.keywords,
    required this.creator,
    required this.country,
    required this.category,
  });

  factory Article.fromJson(Map<String, dynamic> json) => _$modelFromJson(json);
  Map<String, dynamic> toJson() => _$modelToJson(this);
}
