import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/news_app/model/news_model.dart';

class NewsApi
{

  static NewsApi newsApi=NewsApi();
  Future<NewsModel> getApi(String? con)
  async {
    String? link="https://newsapi.org/v2/top-headlines?country=$con&category=business&apiKey=ea4e72cf02ce4c0590f672186e1bd81f";
    var respones=await http.get(Uri.parse(link));
    var jsondata=jsonDecode(respones.body);
    return await NewsModel.fromjson(jsondata);
  }
}