import 'package:blog_yan/utils/fy_routers.dart';
import "package:leancloud_storage/leancloud.dart";
import 'package:flutter/material.dart';

import 'model/blog.dart';
import 'model/category.dart';

final appId = "0e7yy2Fzv9DNv9qXYRrRWQaC-MdYXbMMI";
final appKey = "rs2AN2MrGqaRH5u8xAPib2y1";
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LeanCloud.initialize(appId, appKey, queryCache: new LCQueryCache());
    registModelClass();
    return new MaterialApp(
      title: 'BlogYan',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: FYRouters.routers(context),
    );
  }

  registModelClass() {
    LCObject.registerSubclass<Category>("Category", () => new Category());
    LCObject.registerSubclass<Blog>("Blog", () => new Blog());
  }
}
