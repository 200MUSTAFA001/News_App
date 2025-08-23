import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/news_model.dart';

final dio = Dio();
const apiKey = "pub_877076b34106705470f72cdbbb09f91807e3c";
const removeDuplicateUrl = "removeduplicate=1";
const baseUrl = "https://newsdata.io/api/1/latest?apikey=";
final limitError = false.obs;

class NewsService {
  Future<NewsModel?> fetchNewsByQuery(String query, String lang) async {
    try {
      final url = "$baseUrl$apiKey&q=$query&language=$lang&$removeDuplicateUrl";
      final response = await dio.get(url);

      final result = NewsModel.fromJson(response.data);
      limitError.value = false;
      return result;
    } catch (e) {
      log(e.toString());
      limitError.value = true;
      return null;
    }
  }

  Future<NewsModel?> fetchNewsByCategory(String category, String lang) async {
    try {
      final url =
          "$baseUrl$apiKey&category=$category&language=$lang&$removeDuplicateUrl";
      final response = await dio.get(url);

      final result = NewsModel.fromJson(response.data);
      limitError.value = false;
      return result;
    } catch (e) {
      log(e.toString());
      limitError.value = true;
      return null;
    }
  }
}

class NextPage {
  Future<NewsModel?> fetchMoreArticles(
      String category, String lang, String nextPage) async {
    try {
      final url =
          "$baseUrl$apiKey&q=$category&language=$lang&$removeDuplicateUrl&page=$nextPage";
      final response = await dio.get(url);

      final result = NewsModel.fromJson(response.data);
      limitError.value = false;
      return result;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
