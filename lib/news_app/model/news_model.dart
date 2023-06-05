class NewsModel
{
  String? status;
  int? totalResults;
  List<Articles>? articlesList=[];

  NewsModel({this.status, this.totalResults, this.articlesList});
  
  factory NewsModel.fromjson(Map m1)
  {
    List articles=m1['articles'];
    return NewsModel(articlesList:articles.map((e)=> Articles.fromjason(e)).toList(),status: m1['status'],totalResults: m1['totalResults']);
  }

}

class Articles
{
  String? author,title,description,url,urlToImage,content;
  Source? source;

  Articles(
      {this.author, this.title, this.description, this.url, this.urlToImage,
         this.content, this.source});
  factory Articles.fromjason(Map m1)
  {
    return Articles(title: m1['title'],description: m1['description'],url: m1['url'],content: m1['content'],author: m1['author'],source: Source.fromjson(m1['source']),urlToImage: m1['urlToImage']);
  }
}

class Source
{
  String? id,name;

  Source({this.id, this.name});
  
  factory Source.fromjson(Map m1)
  {
    return Source(id: m1['id'],name: m1['name']);
  }

}