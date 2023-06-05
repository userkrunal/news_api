import 'package:flutter/material.dart';
import 'package:news_api/news_app/model/news_model.dart';
import 'package:news_api/news_app/provider/news_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
NewsModel newsModel=NewsModel();
class _HomeScreenState extends State<HomeScreen> {

  NewsProvider? npT;
  NewsProvider? npF;
  @override
  Widget build(BuildContext context) {

    npT=Provider.of<NewsProvider>(context,listen: true);
    npF=Provider.of<NewsProvider>(context,listen: false);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: () {
                npF!.changData("us");
              }, child: Text("US",style: TextStyle(color: Colors.black))),
              TextButton(onPressed: () {
                npF!.changData("in");
              }, child: Text("IN",style: TextStyle(color: Colors.black))),
              TextButton(onPressed: () {
                npF!.changData("jp");
              }, child: Text("Jp",style: TextStyle(color: Colors.black))),
              TextButton(onPressed: () {
                npF!.changData("ua");
              }, child: Text("Gr",style: TextStyle(color: Colors.black))),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: npF!.loadNews("${npT!.data}"),
              builder: (context, snapshot) {

                if(snapshot.hasError)
                  {
                    return Text("${snapshot.hasError}");
                  }
                else if(snapshot.hasData)
                  {
                    NewsModel newsModel=snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 40.h,
                              width: 100.w,
                              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                                image: DecorationImage(image: NetworkImage("${newsModel.articlesList![0].urlToImage}"),fit: BoxFit.fill),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${newsModel.articlesList![0].source!.name}",style: TextStyle(fontSize: 25)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${newsModel.articlesList![0].title}",style: TextStyle(fontSize: 15)),
                            ),
                            newsModel.articlesList![0].author==null?Text(""):Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${newsModel.articlesList![0].author}",style: TextStyle(fontSize: 15)),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("${newsModel.articlesList![0].description}",style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("${newsModel.articlesList![0].content}",style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    ));
  }
}
