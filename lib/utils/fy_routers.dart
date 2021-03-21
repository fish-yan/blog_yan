import 'package:blog_yan/pages/blog_list_main_page.dart';
import 'package:blog_yan/pages/blog_page.dart';
import 'package:blog_yan/pages/blog_preview_page.dart';
import 'package:blog_yan/pages/blog_write_page.dart';
import 'package:flutter/material.dart';



class FYRouters {
  static String home = "/";
  static String blogWrite = "/blog_write";
  static String blogPreview = "/blog_preview";
  static String blogListMain = "/blog_list_main";
  static String blogList = "/blog_list";
  static String blog = "/blog";


  static Map<String, WidgetBuilder> routers(BuildContext context) {

    var map = {
      home: BlogListMainPage(),
      blogWrite: BlogWritePage(),
      blogPreview: BlogPreviewPage(),
      blogListMain: BlogListMainPage(),
      blog: BlogPage(),
    };

    Map<String, WidgetBuilder> routers = Map();
    for (var item in map.entries) {
      routers[item.key] = (context) => item.value;
    }
    return routers;
  }
}
