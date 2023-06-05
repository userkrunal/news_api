import 'package:flutter/material.dart';
import 'package:news_api/news_app/api_helper/news_api.dart';
import 'package:news_api/news_app/model/news_model.dart';

class NewsProvider extends ChangeNotifier
{

  String data="US";
  void changData(String contry)
  {
    data=contry;
    notifyListeners();
  }

  Future<NewsModel> loadNews(String? con)
  async {
    return await NewsApi.newsApi.getApi(con);
    notifyListeners();
  }
}