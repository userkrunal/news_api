import 'package:flutter/material.dart';
import 'package:news_api/news_app/provider/news_provider.dart';
import 'package:news_api/news_app/view/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return ChangeNotifierProvider(
        create: (context) => NewsProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context) => HomeScreen(),
          },
        ),
      );
    },)
  );
}